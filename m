Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5845128492
	for <lists+linux-fbdev@lfdr.de>; Thu, 23 May 2019 19:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbfEWRMj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 23 May 2019 13:12:39 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34592 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731106AbfEWRMj (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 23 May 2019 13:12:39 -0400
Received: by mail-qt1-f196.google.com with SMTP id h1so7652765qtp.1
        for <linux-fbdev@vger.kernel.org>; Thu, 23 May 2019 10:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vDNJN8bEd9Yh4fMOJ0peDCFHARDIqG9m54hbvEEPNgw=;
        b=D62GeshsxKORMN57+kFrEgrOvbDqxjFyi43477Bc4b45hLHGyez95Is6P/pYmOfhZE
         /5x+FUHTOTmtGDoCLnZ4U7Jit6fqJChc8e5Lw8sO79VkrHGwzIp3RyqpUY8siOYLeItK
         IQiUH8XOFidjlwKh2ENCmdZgwUuNSBylFBS/HeiAZ/nhdebxb7XsQKknwtxJPJagOtTi
         7H4yqLY+wN71VP7gJh7i9dbfX6s+LZqLBFPyr0UsHVG8ntL9LELEyri/aBDNIlC6k3GR
         wJmNrXmQ9AO7dDVMNMw46IEVQl4SR8bumSJtMBr3L2mHxS4t8uWTiF7lD0p0oDDMJSwY
         FWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vDNJN8bEd9Yh4fMOJ0peDCFHARDIqG9m54hbvEEPNgw=;
        b=BGyctcssxnFVrqqwY71ltyacyjJzKlDIcX4ag0tvkDe2yoThkPd+sp0ggK8XxG3RHn
         ZX05msiJ4X58LUJiIFwDuxrh3PBI7muGfTsMZ7wzm5r//49kYjGg+jC6/6jQVd9mq4gB
         +h4oxiJu4xOhfYYWeTIEoWDOuC6vsrpy3xLB2vnH7rg3+q5rRGJRyGsaSBfm9nbEX42o
         Cz9pjE0D2Jayqy93qbEIocB5g2qrdCbSIpSYA/XWXh8+ysw/8fvJks9YC9v3jodqm6VD
         OFX5XAikXd7ywIH7cYlMNQwuYcWBQ7PT2XKPePcsjUHVLnXk0E7zNXGE+zGGzo76zVHH
         0kYQ==
X-Gm-Message-State: APjAAAXRV+9fVY63+4WEPeZ1cX/zouulQ+leTmBM47MOuhtCSqcKCSSi
        zJhNTtljOyz3whORiSoOB2T0vg==
X-Google-Smtp-Source: APXvYqzWJkE4AfQCBYO4RiNlvpUtz+Y7BPM4A74JlReLYm+Fudbm8E+F73NOHoDxPhADSg7xzgVO+A==
X-Received: by 2002:ac8:1a59:: with SMTP id q25mr82697732qtk.154.1558631558700;
        Thu, 23 May 2019 10:12:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id x10sm2691348qkl.84.2019.05.23.10.12.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 10:12:38 -0700 (PDT)
Date:   Thu, 23 May 2019 13:12:37 -0400
From:   Sean Paul <sean@poorly.run>
To:     "Shankar, Uma" <uma.shankar@intel.com>
Cc:     Sean Paul <sean@poorly.run>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Sharma, Shashank" <shashank.sharma@intel.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hansverk@cisco.com>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH] drm/edid: Fix docbook in
 drm_hdmi_infoframe_set_hdr_metadata()
Message-ID: <20190523171237.GD17077@art_vandelay>
References: <20190523135504.184354-1-sean@poorly.run>
 <E7C9878FBA1C6D42A1CA3F62AEB6945F8203029D@BGSMSX104.gar.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E7C9878FBA1C6D42A1CA3F62AEB6945F8203029D@BGSMSX104.gar.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, May 23, 2019 at 02:38:37PM +0000, Shankar, Uma wrote:
> 
> 
> >-----Original Message-----
> >From: Sean Paul [mailto:sean@poorly.run]
> >Sent: Thursday, May 23, 2019 7:25 PM
> >To: dri-devel@lists.freedesktop.org
> >Cc: Sean Paul <seanpaul@chromium.org>; Shankar, Uma <uma.shankar@intel.com>;
> >Sharma, Shashank <shashank.sharma@intel.com>; Ville Syrjälä
> ><ville.syrjala@linux.intel.com>; Maarten Lankhorst
> ><maarten.lankhorst@linux.intel.com>; Maxime Ripard
> ><maxime.ripard@bootlin.com>; Sean Paul <sean@poorly.run>; David Airlie
> ><airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Bartlomiej Zolnierkiewicz
> ><b.zolnierkie@samsung.com>; Hans Verkuil <hansverk@cisco.com>; linux-
> >fbdev@vger.kernel.org
> >Subject: [PATCH] drm/edid: Fix docbook in drm_hdmi_infoframe_set_hdr_metadata()
> >
> >From: Sean Paul <seanpaul@chromium.org>
> >
> >Fixes the following warnings:
> >../drivers/gpu/drm/drm_edid.c:4925: warning: Function parameter or member
> >'conn_state' not described in 'drm_hdmi_infoframe_set_hdr_metadata'
> >../drivers/gpu/drm/drm_edid.c:4925: warning: Excess function parameter
> >'hdr_metadata' description in 'drm_hdmi_infoframe_set_hdr_metadata'
> 
> Thanks Sean Paul for fixing this.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>

Pushed to -misc-next, thank you for the review!

Sean

> 
> >Fixes: 2cdbfd66a829 ("drm: Enable HDR infoframe support")
> >Cc: Uma Shankar <uma.shankar@intel.com>
> >Cc: Shashank Sharma <shashank.sharma@intel.com>
> >Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> >Cc: Sean Paul <sean@poorly.run>
> >Cc: David Airlie <airlied@linux.ie>
> >Cc: Daniel Vetter <daniel@ffwll.ch>
> >Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> >Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> >Cc: Hans Verkuil <hansverk@cisco.com>
> >Cc: dri-devel@lists.freedesktop.org
> >Cc: linux-fbdev@vger.kernel.org
> >Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >---
> > drivers/gpu/drm/drm_edid.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c index
> >262510c2a670..d87f574feeca 100644
> >--- a/drivers/gpu/drm/drm_edid.c
> >+++ b/drivers/gpu/drm/drm_edid.c
> >@@ -4914,7 +4914,7 @@ static inline bool is_eotf_supported(u8 output_eotf, u8
> >sink_eotf)
> >  * drm_hdmi_infoframe_set_hdr_metadata() - fill an HDMI DRM infoframe with
> >  *                                         HDR metadata from userspace
> >  * @frame: HDMI DRM infoframe
> >- * @hdr_metadata: hdr_source_metadata info from userspace
> >+ * @conn_state: Connector state containing HDR metadata
> >  *
> >  * Return: 0 on success or a negative error code on failure.
> >  */
> >--
> >Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
