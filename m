Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE46C4B512A
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Feb 2022 14:07:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbiBNNHX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Feb 2022 08:07:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbiBNNHW (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Feb 2022 08:07:22 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463AE4BFDF;
        Mon, 14 Feb 2022 05:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644844029; x=1676380029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=cmRpyW5YxpRg0c6HVe02t3+JA7Epz3P6WvJ1r9gZPiM=;
  b=fwnRiMLdnK/rmaMb7i6Y8iHrmqfh05bm8jOVB+xUxzKzpjVXqo6YXCAM
   tP2aebyqD3f2Kov0sU36MQ6VugzMbpZiEMB24R4mQW5D4p6Q4bxn3GfDp
   nscKJRZ23130KaUivYRP5tWZ5Ya3gjKJbO06iV02TBtuUkfd73tGMQ+m3
   UE1S1Asn0wFByk6osL1SwBfOOsjt/0GE9JsNRzY7vQipL6fH+9+VsVxm5
   zaQ1QiDvgw5UHTQDJPk2ni2hKttiGdMi4A4mojvmuPoZ54Qx2pL93pLm0
   25Ax/qAYIcc37W5kR3/VqctpXpcsJcOJhHnVVQCFRhrwMbITXA7s6Qf3q
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230721425"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="230721425"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 05:07:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; 
   d="scan'208";a="543555384"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
  by orsmga008.jf.intel.com with SMTP; 14 Feb 2022 05:07:04 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 14 Feb 2022 15:07:03 +0200
Date:   Mon, 14 Feb 2022 15:07:03 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Javier Martinez Canillas <javierm@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <YgpT91j+WajkuqXm@intel.com>
References: <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com>
 <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <f87ce2fa-6b18-f985-eb86-506ce7103db3@suse.de>
 <YgoxFBGNsrezVxmi@smile.fi.intel.com>
 <5ee24960-7843-827a-2c47-b93a4b4798e3@suse.de>
 <YgpPR/lObRWwkjNN@intel.com>
 <65010c63-ef8a-4fff-00e4-73a9b6fd05b8@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65010c63-ef8a-4fff-00e4-73a9b6fd05b8@suse.de>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Mon, Feb 14, 2022 at 01:54:59PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 14.02.22 um 13:47 schrieb Ville Syrj�l�:
> > On Mon, Feb 14, 2022 at 01:12:48PM +0100, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 14.02.22 um 11:38 schrieb Andy Shevchenko:
> >>> On Mon, Feb 14, 2022 at 10:03:53AM +0100, Thomas Zimmermann wrote:
> >>>> Am 11.02.22 um 16:41 schrieb Andy Shevchenko:
> >>>
> >>> ...
> >>>
> >>>>>> IMO *always* prefer a for loop over while or do-while.
> >>>>>>
> >>>>>> The for (i = 0; i < N; i++) is such a strong paradigm in C. You
> >>>>>> instantly know how many times you're going to loop, at a glance. Not so
> >>>>>> with with the alternatives, which should be used sparingly.
> >>>>>
> >>>>> while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it.
> >>>>
> >>>> Naw, that's not true.
> >>>
> >>> In the section 3.5 "Loops - While and For" in "The C Programming
> >>> Language" 2nd by K&R, the authors said:
> >>
> >> Year of publication: 1988 . It's not the most up-to-date reference for C
> >> programming.
> >>
> >>>
> >>> 	The for statement ... is equivalent to ... while..."
> >>>
> >>> They said that for is equivalent to while, and not otherwise.
> >>
> >> Even leaving readability aside, it's not equivalent. You can declare
> >> variables as part of the for statement. (I know it's not the kernel's
> >> style.) Also, 'continue' statements are not well-suited in for loops,
> >> because it's non-obvious if the loop's update statement is being
> >> executed. (It isn't.)
> > 
> > It is.
> > 
> > 'continue' is just shorthand for 'goto end_of_loop_body'.
> 
> Well, indeed. lol
> 
> Fun fact: I actually had to look this up and still got it wrong. Let me 
> just count it under proving-my-point: continue in a for statement is a 
> bad idea and for isn't equivalent to while.

Nah. We use 'continue' a *lot* in for loops in kms/atomic code.
I'd be surprised if you can find many loops without a 'continue'.

Looking at the loc stats I was a bit surprised to see more 'break'
but then I realized switch() is bloating up those numbers quite
a bit.

-- 
Ville Syrj�l�
Intel
