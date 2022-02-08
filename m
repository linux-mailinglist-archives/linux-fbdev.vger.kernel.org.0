Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 844C44AE0AA
	for <lists+linux-fbdev@lfdr.de>; Tue,  8 Feb 2022 19:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384819AbiBHSYJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 8 Feb 2022 13:24:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384814AbiBHSYJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Tue, 8 Feb 2022 13:24:09 -0500
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com [91.221.196.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18639C061579
        for <linux-fbdev@vger.kernel.org>; Tue,  8 Feb 2022 10:24:07 -0800 (PST)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
        by mx1.smtp.larsendata.com (Halon) with ESMTPS
        id 72537d88-890c-11ec-b20b-0050568c148b;
        Tue, 08 Feb 2022 18:25:09 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sam@ravnborg.org)
        by mail01.mxhotel.dk (Postfix) with ESMTPSA id 16C32194BDF;
        Tue,  8 Feb 2022 19:24:06 +0100 (CET)
Date:   Tue, 8 Feb 2022 19:24:03 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From:   Sam Ravnborg <sam@ravnborg.org>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Claudio Suarez <cssk@net-c.es>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 11/21] fbcon: Extract fbcon_open/release helpers
Message-ID: <YgK1Qz6eIKD9wHre@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-12-daniel.vetter@ffwll.ch>
 <YfxF4jq7BLX5rJe5@ravnborg.org>
 <YgJ0relUFpnxRvhg@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgJ0relUFpnxRvhg@phenom.ffwll.local>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Daniel,

On Tue, Feb 08, 2022 at 02:48:29PM +0100, Daniel Vetter wrote:
> On Thu, Feb 03, 2022 at 10:15:14PM +0100, Sam Ravnborg wrote:
> > Hi Daniel,
> > 
> > On Mon, Jan 31, 2022 at 10:05:42PM +0100, Daniel Vetter wrote:
> > > There's two minor behaviour changes in here:
> > > - in error paths we now consistently call fb_ops->fb_release
> > > - fb_release really can't fail (fbmem.c ignores it too) and there's no
> > >   reasonable cleanup we can do anyway.
> > > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Claudio Suarez <cssk@net-c.es>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > > Cc: Du Cheng <ducheng2@gmail.com>
> > > ---
> > >  drivers/video/fbdev/core/fbcon.c | 107 +++++++++++++++----------------
> > >  1 file changed, 53 insertions(+), 54 deletions(-)
> > > 
> > > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > > index fa30e1909164..eea2ee14b64c 100644
> > > --- a/drivers/video/fbdev/core/fbcon.c
> > > +++ b/drivers/video/fbdev/core/fbcon.c
> > > @@ -680,19 +680,37 @@ static int fbcon_invalid_charcount(struct fb_info *info, unsigned charcount)
> > >  
> > >  #endif /* CONFIG_MISC_TILEBLITTING */
> > >  
> > > +static int fbcon_open(struct fb_info *info)
> > > +{
> > > +	if (!try_module_get(info->fbops->owner))
> > > +		return -ENODEV;
> > > +
> > > +	if (info->fbops->fb_open &&
> > > +	    info->fbops->fb_open(info, 0)) {
> > > +		module_put(info->fbops->owner);
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void fbcon_release(struct fb_info *info)
> > > +{
> > > +	if (info->fbops->fb_release)
> > > +		info->fbops->fb_release(info, 0);
> > > +
> > > +	module_put(info->fbops->owner);
> > > +}
> > >  
> > >  static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
> > >  				  int unit, int oldidx)
> > >  {
> > >  	struct fbcon_ops *ops = NULL;
> > > -	int err = 0;
> > > -
> > > -	if (!try_module_get(info->fbops->owner))
> > > -		err = -ENODEV;
> > > +	int err;
> > >  
> > > -	if (!err && info->fbops->fb_open &&
> > > -	    info->fbops->fb_open(info, 0))
> > > -		err = -ENODEV;
> > > +	err = fbcon_open(info);
> > > +	if (err)
> > > +		return err;
> > >  
> > >  	if (!err) {
> > >  		ops = kzalloc(sizeof(struct fbcon_ops), GFP_KERNEL);
> > > @@ -713,7 +731,7 @@ static int con2fb_acquire_newinfo(struct vc_data *vc, struct fb_info *info,
> > >  
> > >  	if (err) {
> > >  		con2fb_map[unit] = oldidx;
> > > -		module_put(info->fbops->owner);
> > > +		fbcon_release(info);
> > >  	}
> > >  
> > >  	return err;
> > > @@ -724,45 +742,34 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
> > >  				  int oldidx, int found)
> > >  {
> > >  	struct fbcon_ops *ops = oldinfo->fbcon_par;
> > > -	int err = 0, ret;
> > > +	int ret;
> > >  
> > > -	if (oldinfo->fbops->fb_release &&
> > > -	    oldinfo->fbops->fb_release(oldinfo, 0)) {
> > > -		con2fb_map[unit] = oldidx;
> > The old code assigns con2fb_map[unit] before is calls
> > newinfo->fbops->fb_release).
> > I wonder if there can be any callback to fbcon where the value
> > of con2fb_map[unit] matters?
> 
> It's all protected by console_lock, so other threads cannot see the
> inconsistent state.
> 
> Essentially everything in fbcon.c is protected by console_lock().
> 
> Do you want me to hammer this in somewhere (maybe in the commit message),
> or good enough for your ack?

No need to spell it out more.
Add my a-b and apply it.

	Sam
