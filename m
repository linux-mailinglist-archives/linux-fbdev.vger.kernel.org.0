Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D6F2E06E
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 May 2019 17:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfE2PBG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 May 2019 11:01:06 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:45036 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfE2PBF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 May 2019 11:01:05 -0400
Received: by mail-oi1-f196.google.com with SMTP id z65so2272544oia.11
        for <linux-fbdev@vger.kernel.org>; Wed, 29 May 2019 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=28b8Lw/VKP0F/5ijVj5uCNPJtbGPYpXDuGC5vNO+lJU=;
        b=M4kmsUpie/lhA2Q5tCmhz+BPhKZIdIR3B7Fr29DU0e7ELX/tnhWjwfQHAjmxBx27St
         16RO6vEMkp3lyyyov5rtJrdiM30u4PSQYuBoOgoza4IMGxXkEZQsP3CyDz0qnPVSsaiq
         EWLKWe0htlEXCDOPIMqGYBlCYebKa3/nKsojI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=28b8Lw/VKP0F/5ijVj5uCNPJtbGPYpXDuGC5vNO+lJU=;
        b=rpzmid0wIE9YSdC6tMgr2HNM8ayEvb3BpdhgNFrKp9RnC24Lvgsi3ZFA3Zl1b/pshs
         Ra1+4/vgspkDKrHwZ97+gIDBAzfh1cp13aQgEhFRgISLj9qlCYZtW8lritWEyiDisaFq
         v+QkH26o7ecPcT89kd3Cy8Yk8ZNFdg5LbpouL6BvvyfAmE03hsm3eI62zU3P5WIMMvOW
         t1gen5u//u88+OumJ5XdPjRUray7nWcKhDIsThti/t1qWGW87kkelKKkfyqGF5YzUJbu
         Dt/9b0YvQuaJSIVhlQsQHSLKjdjBXkqU70M8nUX/4SKuZ0fVpn8SzW7yAoh8EOFkW1N1
         b2vQ==
X-Gm-Message-State: APjAAAXOD5IiBTCMX58ACFDrsvtRxccH/CNl4ogml7BM+y0UCt1TXUbH
        1edNSuZwQpzCUgstIkAhXk5ahXQX/CwVrMzCJ6WZyA==
X-Google-Smtp-Source: APXvYqxDoZiCU1ACmLGFxGdlV/ZOM5bwRZ/eSuDb2I9G1+CpvJ+bKWQ4iqMLcGok76Bb8VkcGARnnsDtdfjMJhJhsy4=
X-Received: by 2002:aca:31cf:: with SMTP id x198mr883293oix.132.1559142064819;
 Wed, 29 May 2019 08:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <1559141030-4386-1-git-send-email-uma.shankar@intel.com>
In-Reply-To: <1559141030-4386-1-git-send-email-uma.shankar@intel.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 29 May 2019 17:00:51 +0200
Message-ID: <CAKMK7uEoZD3m9cgfBo93jOuei2VB68+9fBTrcduQ=Aybc-PKOw@mail.gmail.com>
Subject: Re: [PATCH] drm: Fix docbook warnings in hdr metadata helper structures
To:     Uma Shankar <uma.shankar@intel.com>
Cc:     intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Shashank Sharma <shashank.sharma@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hansverk@cisco.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, May 29, 2019 at 4:16 PM Uma Shankar <uma.shankar@intel.com> wrote:
>
> Fixes the following warnings:
> ./include/drm/drm_mode_config.h:841: warning: Incorrect use of
> kernel-doc format:          * hdr_output_metadata_property: Connector
> property containing hdr
> ./include/drm/drm_mode_config.h:918: warning: Function parameter or membe=
r 'hdr_output_metadata_property' not described in 'drm_mode_config'
> ./include/drm/drm_connector.h:1251: warning: Function parameter or member=
 'hdr_output_metadata' not described in 'drm_connector'
> ./include/drm/drm_connector.h:1251: warning: Function parameter or member=
 'hdr_sink_metadata' not described in 'drm_connector'
>
> Also adds some property documentation for HDR Metadata Connector
> Property in connector property create function.
>
> Cc: Shashank Sharma <shashank.sharma@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
> Cc: Hans Verkuil <hansverk@cisco.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 8 ++++++++
>  include/drm/drm_connector.h     | 3 ++-
>  include/drm/drm_mode_config.h   | 2 +-
>  include/linux/hdmi.h            | 1 +
>  4 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index c9ac8b9..702307c 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1003,6 +1003,14 @@ int drm_display_info_set_bus_formats(struct drm_di=
splay_info *info,
>   *     can also expose this property to external outputs, in which case =
they
>   *     must support "None", which should be the default (since external =
screens
>   *     have a built-in scaler).
> + *
> + * HDR_OUTPUT_METADATA:
> + *     Connector property to enable userspace to send HDR Metadata to dr=
iver.
> + *     This metadata is based on the composition and blending policies d=
ecided
> + *     by user, taking into account the hardware and sink capabilties.
> + *     The driver gets this metadata and creates a Dynamic Range and Mas=
tering
> + *     Infoframe (DRM) which is then sent to sink. This notifies the sin=
k of
> + *     the upcoming frame's Color Encoding and Luminance parameters.
>   */

Assuming I'm applying this correctly your adding this to the "lcd
panel properties" section. That doesn't make sense to me. I think we
already have a section for hdmi properties somewhere, would fit better
there.

This should also contain a bit more about how this is supposed to
work, how it's set up from a driver pov (sprinkle links all over it)
and how userspace it supposed to use it.

I think since this is a using a rather complicated struct I think we
need to fully document that structure too. Atm uapi/drm_mode.h isn't
pulled into anywhere, so we need to fix that (a new chapter titled
"Userspace API Structures" in drm-uapi.rst would be good, cross-links
will work).

>
>  int drm_connector_create_standard_properties(struct drm_device *dev)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f8f4003..f226ef0 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1244,8 +1244,9 @@ struct drm_connector {
>          */
>         struct llist_node free_node;
>
> -       /* HDR metdata */
> +       /** @hdr_output_metadata: HDR Metadata to be sent to sink */
>         struct hdr_output_metadata hdr_output_metadata;

Uh, is this even used? It would be a bug if so, since the state
userspace can set must be stored in drm_connector_state, not in
drm_connector. Only read-only stuff can be in there.

Please don't just blindly type docs, try to make sure that what you're
documenting actually makes sense. Also, should have been a clear sign
that you've forgotten to document one of the properties in the
enumeration above.
-Daniel

> +       /** @hdr_sink_metadata: HDR Metadata Information read from sink *=
/
>         struct hdr_sink_metadata hdr_sink_metadata;
>  };
>
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.=
h
> index 4f88cc9..0b180e0 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -837,7 +837,7 @@ struct drm_mode_config {
>         struct drm_property *writeback_out_fence_ptr_property;
>
>         /**
> -        * hdr_output_metadata_property: Connector property containing hd=
r
> +        * @hdr_output_metadata_property: Connector property containing h=
dr
>          * metatda. This will be provided by userspace compositors based
>          * on HDR content
>          */
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index ee55ba5..ea5858e 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -398,6 +398,7 @@ ssize_t hdmi_vendor_infoframe_pack_only(const struct =
hdmi_vendor_infoframe *fram
>   * @spd: spd infoframe
>   * @vendor: union of all vendor infoframes
>   * @audio: audio infoframe
> + * @drm: DRM infoframe
>   *
>   * This is used by the generic pack function. This works since all infof=
rames
>   * have the same header which also indicates which type of infoframe sho=
uld be
> --
> 1.9.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
