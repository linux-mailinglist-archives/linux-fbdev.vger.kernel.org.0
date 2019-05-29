Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7070C2DFE6
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 May 2019 16:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfE2Ofp (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 May 2019 10:35:45 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34933 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfE2Ofo (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 May 2019 10:35:44 -0400
Received: by mail-qt1-f195.google.com with SMTP id w1so2851764qts.2
        for <linux-fbdev@vger.kernel.org>; Wed, 29 May 2019 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qIlb67t4dIQrVRb+q6rjANH60v2weA2H4sYbUKnG0kU=;
        b=coWkCsBxlQGnIVjpyvEZjmYTT971ulgyMiUkbwz1E9LxZI6I7Q3hSfiM7pKyFFQh/B
         Z5l4cfwhU8Qg/FsoZMQrXGg18rg6/UN7IT3WOv0IgpFM4CTduOodtc5+wRPvDe8Hlg38
         LDIrtlfVajSFfSM1GOs+M6MEemTo0oGSL+4EKZ9VHfOEBBuuYvWYUZrRPAGanDPfY+a6
         0rK36f6I0JZeJ7RGhB3fOwQIi5YR1OiuPnUje1JCLK9nAXiE+x9y7mrUiIWHn2ULAGx8
         gscOpk/0AeXHp222D+z4RN20K8G4I/F3glLRyfVQ4dLb++ShKLZiXchXGlmhV3BJg22K
         ySpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qIlb67t4dIQrVRb+q6rjANH60v2weA2H4sYbUKnG0kU=;
        b=nK74OW1Xh/ak9TzDfJTwrHXQoFxRPg1+akgFXrIXLDDbBPQ+Pl18z2tUjGGHctcV3/
         iVdxR1ovcLSzaT3OIKmX0t8YWxRadyh3PVtbGMWjeYPsrRcVbJv8GiP/6V7cCqQE7RKn
         DH4sIUHfTIaovTuX72FxgTE5K1frqkIXcwzTZl740SMnni/A+HI5rn+nulTTu7spi72U
         ghGBpjMVnYICVY4bTrujtM2tkL3jYBmHAx+NeBY/P4UJTLfJkG87AWFON+C+LoDyF08m
         N8fL2DTsjL0Dw0RBcmG9TZrsDaZ/g3icvnS/cm+rsoRS5jlxXZxs5M4nzGlcTLTB8ZlG
         mLAg==
X-Gm-Message-State: APjAAAXvul0RFuhREdmS5a17jN33DzmYeTsoYQ3AkMZxHv8uKujyjrgP
        5SNkgQInGa5ewjSn+/mBzqo0pg==
X-Google-Smtp-Source: APXvYqxS/b8fFs1MZHT/cpi6nT0OOvwccbW5hWZiG+P1+VkK7TT11xz3MDYFotXt3QgnY9DsS1lLqA==
X-Received: by 2002:a0c:d985:: with SMTP id y5mr81942745qvj.130.1559140538602;
        Wed, 29 May 2019 07:35:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id e5sm2352684qkg.81.2019.05.29.07.35.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 07:35:37 -0700 (PDT)
Date:   Wed, 29 May 2019 10:35:37 -0400
From:   Sean Paul <sean@poorly.run>
To:     Uma Shankar <uma.shankar@intel.com>
Cc:     intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Shashank Sharma <shashank.sharma@intel.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans Verkuil <hansverk@cisco.com>, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] drm: Fix docbook warnings in hdr metadata helper
 structures
Message-ID: <20190529143537.GF17077@art_vandelay>
References: <1559141030-4386-1-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1559141030-4386-1-git-send-email-uma.shankar@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, May 29, 2019 at 08:13:50PM +0530, Uma Shankar wrote:
> Fixes the following warnings:
> ./include/drm/drm_mode_config.h:841: warning: Incorrect use of
> kernel-doc format:          * hdr_output_metadata_property: Connector
> property containing hdr
> ./include/drm/drm_mode_config.h:918: warning: Function parameter or member 'hdr_output_metadata_property' not described in 'drm_mode_config'
> ./include/drm/drm_connector.h:1251: warning: Function parameter or member 'hdr_output_metadata' not described in 'drm_connector'
> ./include/drm/drm_connector.h:1251: warning: Function parameter or member 'hdr_sink_metadata' not described in 'drm_connector'
> 
> Also adds some property documentation for HDR Metadata Connector
> Property in connector property create function.
> 
> Cc: Shashank Sharma <shashank.sharma@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
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
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index c9ac8b9..702307c 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1003,6 +1003,14 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
>   *	can also expose this property to external outputs, in which case they
>   *	must support "None", which should be the default (since external screens
>   *	have a built-in scaler).
> + *
> + * HDR_OUTPUT_METADATA:
> + *	Connector property to enable userspace to send HDR Metadata to driver.
> + *	This metadata is based on the composition and blending policies decided
> + *	by user, taking into account the hardware and sink capabilties.

capabilities

> + *	The driver gets this metadata and creates a Dynamic Range and Mastering
> + *	Infoframe (DRM) which is then sent to sink. This notifies the sink of
> + *	the upcoming frame's Color Encoding and Luminance parameters.
>   */
>  
>  int drm_connector_create_standard_properties(struct drm_device *dev)
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index f8f4003..f226ef0 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1244,8 +1244,9 @@ struct drm_connector {
>  	 */
>  	struct llist_node free_node;
>  
> -	/* HDR metdata */
> +	/** @hdr_output_metadata: HDR Metadata to be sent to sink */
>  	struct hdr_output_metadata hdr_output_metadata;
> +	/** @hdr_sink_metadata: HDR Metadata Information read from sink */
>  	struct hdr_sink_metadata hdr_sink_metadata;
>  };
>  
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 4f88cc9..0b180e0 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -837,7 +837,7 @@ struct drm_mode_config {
>  	struct drm_property *writeback_out_fence_ptr_property;
>  
>  	/**
> -	 * hdr_output_metadata_property: Connector property containing hdr
> +	 * @hdr_output_metadata_property: Connector property containing hdr
>  	 * metatda. This will be provided by userspace compositors based

May as well fix the spelling of "metadata" while you're here.

>  	 * on HDR content
>  	 */
> diff --git a/include/linux/hdmi.h b/include/linux/hdmi.h
> index ee55ba5..ea5858e 100644
> --- a/include/linux/hdmi.h
> +++ b/include/linux/hdmi.h
> @@ -398,6 +398,7 @@ ssize_t hdmi_vendor_infoframe_pack_only(const struct hdmi_vendor_infoframe *fram
>   * @spd: spd infoframe
>   * @vendor: union of all vendor infoframes
>   * @audio: audio infoframe
> + * @drm: DRM infoframe

Can you spell this out here so it's unambiguous which DRM you're talking about?

With the nits fixed,

Reviewed-by: Sean Paul <sean@poorly.run>


>   *
>   * This is used by the generic pack function. This works since all infoframes
>   * have the same header which also indicates which type of infoframe should be
> -- 
> 1.9.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
