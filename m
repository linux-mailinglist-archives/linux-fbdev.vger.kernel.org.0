Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2334C4263
	for <lists+linux-fbdev@lfdr.de>; Fri, 25 Feb 2022 11:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239511AbiBYKgG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 25 Feb 2022 05:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239519AbiBYKgF (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 25 Feb 2022 05:36:05 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289B522EDDE
        for <linux-fbdev@vger.kernel.org>; Fri, 25 Feb 2022 02:35:33 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id k2so6901900oia.2
        for <linux-fbdev@vger.kernel.org>; Fri, 25 Feb 2022 02:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=26Nq0o7hW5EZ+8zlie26/Pg6VPaTLwAo76Sjggh2s9k=;
        b=zKx334hk9YYZQLmFcJLwy/bhLPL4nd88z46U1TvpNH4CBaimEjqyFvqFfe0+pvoisT
         a8rTK8wQIa1WIjCsLWQFtQEk4jHTxlGn4MlHcRlLanlTSoYtz0GyRx3nyxnKVQ+b3eLt
         iWH/c1s/R3dNimGvEnt6n54r/jamln3WVqxzN0bUrCG4pIj2t4RnvFbZeJSI7AIuRaGW
         zh5ty2BYi47FyZEKCGSGEF0YtYUsfjMUVZuss/Etk47hdydFLY6R6rYPBZyQ8CZblE/r
         orrOWIZ+WFwBeyj6Lt1OrNz3IFe8fzfZy4tqkve08O0PMzSaGBTSyrbSW8LDg9YBgMuh
         w90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=26Nq0o7hW5EZ+8zlie26/Pg6VPaTLwAo76Sjggh2s9k=;
        b=MwT6GK4GPhA93EjljyN+3I8fav63lioYrXWkYvRRUZVriUHPbfr0gsKqhM1GF0nhB1
         dTwrTlmeEHk0Vj02sqA4qq3/HauTxzdtuB+d+TOrp2MyjemhySdbIudXXT9tZ4q1rSsl
         QQPElcSG7DqKa10ydph2uey31IVzEspvyJBISFHeDWA1AcV50SY/etqnw20w21iDh47t
         X8S7vi9f2AB2pCqVdv+Sgzp+QwnC9HPwBbtQXn3LJlo2RevzLar2wSgRugSZImUhyDr3
         QHDQrLnEGELNFYUMVTMMW8t9oKIyBzx4xySnrjvgWSFTs8JfUI0iYzH9PFd+o28mJ9Co
         wDaw==
X-Gm-Message-State: AOAM532nUPnmeercjFHTCfv2MXpfA+uxwu4fb/DKdDnB2QMXZGV+L7h0
        PP4OkwExa6Ga1494WKob+I1ms7tV+4BWMvy6rIInsA==
X-Google-Smtp-Source: ABdhPJwdkXioRfNt7+rdkdBWZGF6zg1vz8KD9b676zdXSu/0Gu8LknuEXMmkdSaXJIsGyK/aLaQ+addZ9GDQQLiMdjc=
X-Received: by 2002:a05:6808:114e:b0:2d5:4101:844e with SMTP id
 u14-20020a056808114e00b002d54101844emr1154232oiu.169.1645785332453; Fri, 25
 Feb 2022 02:35:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 02:35:31 -0800
MIME-Version: 1.0
In-Reply-To: <c5a83b5f-91cc-61f9-a570-fafb5672de9f@collabora.com>
References: <20220218145437.18563-1-granquet@baylibre.com> <20220218145437.18563-4-granquet@baylibre.com>
 <c5a83b5f-91cc-61f9-a570-fafb5672de9f@collabora.com>
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date:   Fri, 25 Feb 2022 02:35:31 -0800
Message-ID: <CABnWg9t0nW8NRkiLHvWRoavfUbOKL5wG00dbuY8qZW=WeTHxMw@mail.gmail.com>
Subject: Re: [PATCH v8 03/19] drm/edid: Add cea_sad helpers for freq/length
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, airlied@linux.ie,
        chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org,
        ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de,
        jitao.shi@mediatek.com, kishon@ti.com,
        maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
        mripard@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
        tzimmermann@suse.de, vkoul@kernel.org
Cc:     dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-fbdev@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Quoting AngeloGioacchino Del Regno (2022-02-21 15:30:04)
> Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > This patch adds two helper functions that extract the frequency and word
> > length from a struct cea_sad.
> >
> > For these helper functions new defines are added that help translate the
> > 'freq' and 'byte2' fields into real numbers.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >   drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++++++++
> >   include/drm/drm_edid.h     | 18 ++++++++--
> >   2 files changed, 90 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 12893e7be89bb..500279a82167a 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4747,6 +4747,80 @@ int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb)
> >   }
> >   EXPORT_SYMBOL(drm_edid_to_speaker_allocation);
> >
> > +/**
> > + * drm_cea_sad_get_sample_rate - Extract the sample rate from cea_sad
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad frequency field and returns the sample rate in Hz.
> > + *
> > + * Return: Sample rate in Hz or a negative errno if parsing failed.
> > + */
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad)
> > +{
> > +     switch (sad->freq) {
> > +     case DRM_CEA_SAD_FREQ_32KHZ:
> > +             return 32000;
> > +     case DRM_CEA_SAD_FREQ_44KHZ:
> > +             return 44100;
> > +     case DRM_CEA_SAD_FREQ_48KHZ:
> > +             return 48000;
> > +     case DRM_CEA_SAD_FREQ_88KHZ:
> > +             return 88200;
> > +     case DRM_CEA_SAD_FREQ_96KHZ:
> > +             return 96000;
> > +     case DRM_CEA_SAD_FREQ_176KHZ:
> > +             return 176400;
> > +     case DRM_CEA_SAD_FREQ_192KHZ:
> > +             return 192000;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_sample_rate);
> > +
> > +static bool drm_cea_sad_is_uncompressed(const struct cea_sad *sad)
> > +{
> > +     switch (sad->format) {
> > +     case HDMI_AUDIO_CODING_TYPE_STREAM:
> > +     case HDMI_AUDIO_CODING_TYPE_PCM:
> > +             return true;
> > +     default:
> > +             return false;
> > +     }
> > +}
> > +
> > +/**
> > + * drm_cea_sad_get_uncompressed_word_length - Extract word length
> > + * @sad: Pointer to the cea_sad struct
> > + *
> > + * Extracts the cea_sad byte2 field and returns the word length for an
> > + * uncompressed stream.
> > + *
> > + * Note: This function may only be called for uncompressed audio.
> > + *
> > + * Return: Word length in bits or a negative errno if parsing failed.
> > + */
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad)
> > +{
> > +     if (!drm_cea_sad_is_uncompressed(sad)) {
> > +             DRM_WARN("Unable to get the uncompressed word length for a compressed format: %u\n",
> > +                      sad->format);
> > +             return -EINVAL;
> > +     }
> > +
> > +     switch (sad->byte2) {
> > +     case DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT:
> > +             return 16;
> > +     case DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT:
> > +             return 20;
> > +     case DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT:
> > +             return 24;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
> > +EXPORT_SYMBOL(drm_cea_sad_get_uncompressed_word_length);
> > +
> >   /**
> >    * drm_av_sync_delay - compute the HDMI/DP sink audio-video sync delay
> >    * @connector: connector associated with the HDMI/DP sink
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 18f6c700f6d02..a30452b313979 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -361,12 +361,24 @@ struct edid {
> >
> >   /* Short Audio Descriptor */
> >   struct cea_sad {
> > -     u8 format;
> > +     u8 format; /* See HDMI_AUDIO_CODING_TYPE_* */
>
> Hello Guillaume,
>
> since you're adding comments to all the rest of the struct members,
> I think that a small effort to instead convert this to kerneldoc is
> totally worth it.
> Can you please do that?
>
> Thanks,
> Angelo
>
Hello Angelo,

Sure, that's a good suggestion.

Thx,
Guillaume.
> >       u8 channels; /* max number of channels - 1 */
> > -     u8 freq;
> > +     u8 freq; /* See CEA_SAD_FREQ_* */
> >       u8 byte2; /* meaning depends on format */
> >   };
> >
> > +#define DRM_CEA_SAD_FREQ_32KHZ  BIT(0)
> > +#define DRM_CEA_SAD_FREQ_44KHZ  BIT(1)
> > +#define DRM_CEA_SAD_FREQ_48KHZ  BIT(2)
> > +#define DRM_CEA_SAD_FREQ_88KHZ  BIT(3)
> > +#define DRM_CEA_SAD_FREQ_96KHZ  BIT(4)
> > +#define DRM_CEA_SAD_FREQ_176KHZ BIT(5)
> > +#define DRM_CEA_SAD_FREQ_192KHZ BIT(6)
> > +
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_16BIT BIT(0)
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_20BIT BIT(1)
> > +#define DRM_CEA_SAD_UNCOMPRESSED_WORD_24BIT BIT(2)
> > +
> >   struct drm_encoder;
> >   struct drm_connector;
> >   struct drm_connector_state;
> > @@ -374,6 +386,8 @@ struct drm_display_mode;
> >
> >   int drm_edid_to_sad(struct edid *edid, struct cea_sad **sads);
> >   int drm_edid_to_speaker_allocation(struct edid *edid, u8 **sadb);
> > +int drm_cea_sad_get_sample_rate(const struct cea_sad *sad);
> > +int drm_cea_sad_get_uncompressed_word_length(const struct cea_sad *sad);
> >   int drm_av_sync_delay(struct drm_connector *connector,
> >                     const struct drm_display_mode *mode);
> >
>
>
