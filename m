Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B485844735
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2019 18:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfFMQ5u (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Jun 2019 12:57:50 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51454 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393220AbfFMQ5n (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Jun 2019 12:57:43 -0400
Received: by mail-wm1-f66.google.com with SMTP id 207so3096623wma.1
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2019 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dTTO7zlU48dQaMT0UfUehKAW8Upqk/+G5Ghmu7LRMdA=;
        b=VQp4PpzBQyfeG6pMyK0fSn0qnlFqWcipP6bQbGMzwhMuZgRoUjKej6xOA3+cX6Ceyx
         3ouPUJzlhAHzY9PLvHmDF2b7J2/G3dBiFZJR1nb0t1l5T2M5zKoD7N4ZPKl25AQyHOc5
         VASOx9tH8M31Nd3KWy0busaCNm274ygVE2sQzo15wSxr99XZhe6Sczd1YypqJ51nD2wn
         a37ACoDpSfdL+X70k1mugzHRvhJJbmBnWiipp1x4s47ttXLYVFVJmsC5QMAwo61+exx2
         u1Rn9alWiCE1XnQA1m5SCDzqy8vKi6mkmPkm0jCgkmAIuHNvAKl2sNtTn+eRFNhDiai3
         37nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dTTO7zlU48dQaMT0UfUehKAW8Upqk/+G5Ghmu7LRMdA=;
        b=UuQtkLx/bf4JlLIsHTvG0IssMsIFC3j2t/9hOjjEoU/gN/0Ud6HBDJqL/mK86vPD6b
         TdI/EaEMS1Ag/cpQOU14JXrOEWGdU5BJ0j4HzajFExuThM44EnJZjFqvZT7NunC04WCW
         UzzenkxkNbhfw33PquyBL2pTs4eHJy/w1A1d+EELyXrDGw6BVmQbbKuEK6lDEHhNByfu
         S6QqC45cu98OZwUUDGSEpu5DDZNIWE48GExNAsSaIEUvWY6m7RPe5e0xAYZNgi3rQFrh
         W1xcait7PHmAzKUwGgBo/zgzlZmn0iVNfAcNmGAt72cdsYzm4ypvTp42yXLvhAivEiEn
         ZgQA==
X-Gm-Message-State: APjAAAWqHpvne1OFhsd4JnV6Zf7ozsf1e8vVOU2p7s4NDBrPGR0r83Rg
        +6/c4pwdo0ADgqE4Gb2A7m3sCR0eYxxz4oi1TEo=
X-Google-Smtp-Source: APXvYqz5zGzI2NFbyliDi2xFmHxdpgIrtMjjIaRGg/GnzMmnFTwCuZW4fyzqr8XUCYuHnxI9TbdWspAcJAriToTyy0Q=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr4297923wmc.34.1560445061762;
 Thu, 13 Jun 2019 09:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190613151727.133696-1-sean@poorly.run>
In-Reply-To: <20190613151727.133696-1-sean@poorly.run>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 13 Jun 2019 12:57:29 -0400
Message-ID: <CADnq5_NFNtcgM2HaxEnZi_VcKB=FhxTH7pg0wrWzJcw4YaPzOw@mail.gmail.com>
Subject: Re: [PATCH] drm/connector: Fix kerneldoc warning in
 HDR_OUTPUT_METADATA description
To:     Sean Paul <sean@poorly.run>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans Verkuil <hansverk@cisco.com>,
        David Airlie <airlied@linux.ie>,
        Uma Shankar <uma.shankar@intel.com>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, Jun 13, 2019 at 11:17 AM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> Fixes the following warning:
> ../drivers/gpu/drm/drm_connector.c:981: WARNING: Definition list ends wit=
hout a blank line; unexpected unindent.
>
> Fixes: a09db883e5d9 ("drm: Fix docbook warnings in hdr metadata helper st=
ructures")
> Cc: Shashank Sharma <shashank.sharma@intel.com>
> Cc: Ville Syrj=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: "Ville Syrj=C3=A4" <ville.syrjala@linux.intel.com>
> Cc: Hans Verkuil <hansverk@cisco.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: Sean Paul <sean@poorly.run> (v1)
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index a598a5eb48d21..3ccdcf3dfcde2 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -978,6 +978,7 @@ static const struct drm_prop_enum_list hdmi_colorspac=
es[] =3D {
>   *     Userspace will be responsible to do Tone mapping operation in cas=
e:
>   *             - Some layers are HDR and others are SDR
>   *             - HDR layers luminance is not same as sink
> + *
>   *     It will even need to do colorspace conversion and get all layers
>   *     to one common colorspace for blending. It can use either GL, Medi=
a
>   *     or display engine to get this done based on the capabilties of th=
e
> --
> Sean Paul, Software Engineer, Google / Chromium OS
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
