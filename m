Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFA6344BAD
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2019 21:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbfFMTGd (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Jun 2019 15:06:33 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37601 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729717AbfFMTGd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Jun 2019 15:06:33 -0400
Received: by mail-qt1-f196.google.com with SMTP id y57so23895614qtk.4
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2019 12:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+ZsPXDH4cK2O3RcTv7nzaCBUIbQhZQqQ2NCqyKLccnQ=;
        b=WBQgEkYDkQLDDrLdi72I5/aHstJq0wvErREgXQvF9W7+lis14tsbPZm6Jq9ppFlpfH
         bUcNzL0H7Pa4MQRudni4CYhuugsuslpEnyIBfFrLryo/iZkU/kIfjvlOyGBbVZ53ro/6
         k2B9m1jKD+8DrGo9NilmRXB79HWkApxSaynI+6HkVtPPj57oadjjOvAwFonYUwKRpygE
         X7KHa+af1iYGRWV9h5eBULajX4wzPrbLFFiUudFDgAFNgYMmuyJvZxlFtKAlsRMqu+UT
         HKXjLY2HISNj5GICLxWunry08yOjoaTGdqDdA63HKDko0TSn287x12gXmQ7Ve5x2FrsN
         lO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+ZsPXDH4cK2O3RcTv7nzaCBUIbQhZQqQ2NCqyKLccnQ=;
        b=I4zYip+FoBeFwhbskhb68hcBLPy3XZ5qOdN+qchEijdTu43sFYzMF/lIBZUIYNxg51
         VnNIfFxGPXYSDN06hdKRLnzNNkSpT0jj3WuoyCLJ+dWPDpEBqOkLU+OGNxnQoiSHebFQ
         80QmzRmOaRdaw2OYNivj8Be8GL2FROrTEDscy//9prONfYVZyXKSAk/mXfqAfq6NIdKG
         ShRZlDXsMA13KB774lSqLdaQSFzKYZatLzvNAtl+E+OZxRFMlCp1nGwrhWR+s+yB7Y7H
         O7g0byQo7GEe3ZPbo5dzmwE4kez7Tatr0JZh9luYxcR+ThPxbdf6ofzMuNf07DRjoz4O
         v0OQ==
X-Gm-Message-State: APjAAAV7e7CM93kzgap5fCkSxSJKyJb1T6u1vYkwcIMfRkjIuQoF6szF
        2MfMNtno69dKwmHsXhqvN6u8cg==
X-Google-Smtp-Source: APXvYqxPsfYj/CwzF8FsAWAdw8k2oh43WKHpyaGmTVkUBny+3ySY9UWLZDN07dSx2euFudU4/JU1pw==
X-Received: by 2002:ac8:29b2:: with SMTP id 47mr52331507qts.313.1560452791916;
        Thu, 13 Jun 2019 12:06:31 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id p40sm252903qte.93.2019.06.13.12.06.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 12:06:31 -0700 (PDT)
Date:   Thu, 13 Jun 2019 15:06:31 -0400
From:   Sean Paul <sean@poorly.run>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans Verkuil <hansverk@cisco.com>,
        David Airlie <airlied@linux.ie>,
        Uma Shankar <uma.shankar@intel.com>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH] drm/connector: Fix kerneldoc warning in
 HDR_OUTPUT_METADATA description
Message-ID: <20190613190631.GH179831@art_vandelay>
References: <20190613151727.133696-1-sean@poorly.run>
 <CADnq5_NFNtcgM2HaxEnZi_VcKB=FhxTH7pg0wrWzJcw4YaPzOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NFNtcgM2HaxEnZi_VcKB=FhxTH7pg0wrWzJcw4YaPzOw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jun 13, 2019 at 12:57:29PM -0400, Alex Deucher wrote:
> On Thu, Jun 13, 2019 at 11:17 AM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Fixes the following warning:
> > ../drivers/gpu/drm/drm_connector.c:981: WARNING: Definition list ends without a blank line; unexpected unindent.
> >
> > Fixes: a09db883e5d9 ("drm: Fix docbook warnings in hdr metadata helper structures")
> > Cc: Shashank Sharma <shashank.sharma@intel.com>
> > Cc: Ville Syrjä <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: "Ville Syrjä" <ville.syrjala@linux.intel.com>
> > Cc: Hans Verkuil <hansverk@cisco.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: Sean Paul <sean@poorly.run> (v1)
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks Alex, I've applied this to -misc-next

> 
> > ---
> >  drivers/gpu/drm/drm_connector.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index a598a5eb48d21..3ccdcf3dfcde2 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -978,6 +978,7 @@ static const struct drm_prop_enum_list hdmi_colorspaces[] = {
> >   *     Userspace will be responsible to do Tone mapping operation in case:
> >   *             - Some layers are HDR and others are SDR
> >   *             - HDR layers luminance is not same as sink
> > + *
> >   *     It will even need to do colorspace conversion and get all layers
> >   *     to one common colorspace for blending. It can use either GL, Media
> >   *     or display engine to get this done based on the capabilties of the
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
