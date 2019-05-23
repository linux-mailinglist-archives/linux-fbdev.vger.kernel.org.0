Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0558728497
	for <lists+linux-fbdev@lfdr.de>; Thu, 23 May 2019 19:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbfEWRNo (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 23 May 2019 13:13:44 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34572 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731083AbfEWRNn (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 23 May 2019 13:13:43 -0400
Received: by mail-qk1-f195.google.com with SMTP id t64so4078599qkh.1
        for <linux-fbdev@vger.kernel.org>; Thu, 23 May 2019 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=RG+ZTctD0E4v327H7cj6U2Hv8U+evNfg4/vbfaRFcSQ=;
        b=ENE+0RYKSEH2yccpeqmJwI4WpkWm0RIq+YORI72XIt4Agw/uC+Q69wkfG/Ur5L4jn5
         GYTSbO/vIvsySxUq6zTxv1kjEk2VH8OMzREx+EZ/TB2/FgeNt0iiXptICVmULubVorn6
         LHRSZR7TE04fPy9qqUsfb83t4QdBmGq8WI34nK4JE5y/oMdDU0g8Qxza5vuZezATeddZ
         QSkF179XpwfLIhgw4HnGTCEpy5U7yftX18UbxUVLEZlKH+RSaDvg805Za0yxYF1wAxYk
         Spgwrq00qsW2TBQOuT1cAaXIy5khgucTd3yKSvbyMTQ7dqYxeK+Qsl9+1RrA3cR0JDEB
         D+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=RG+ZTctD0E4v327H7cj6U2Hv8U+evNfg4/vbfaRFcSQ=;
        b=oUsoHFLLrhCKnaH/1WzWxMGIbTsNlMzC44WbpX1uUEFG9r3PBkC8dmHqjX3Kcnxp/G
         WBLOLF8Zl1obGaoa+DQigiv2jxlLZkB9KYs7vKVYHhhqtgS+Od0UFYbe8HzVpLR9YWtY
         a1wotYc94rW6RTF5luR6A5y/GWQD0LkiCIah+TLnoCMzXckNuOQk9xaT0gtmHiRRROro
         AKurWtpr1mjmFAGs6DkAc3UXPd7sZm04FQbA04YlrWMlFuphz6gAvzhQcuXX5BZw/Gix
         xWgzOSW2WxuiklvBlEXe8OsXZzG0G+GmAS1R73aP6u79sAGSvl9nRA9LfsCit4/BLIl9
         ET0A==
X-Gm-Message-State: APjAAAV53aPs1ZKf+NrYbrHm4XDqpbeKM8qyyN8Pry3IdEW4Ba2ci27b
        QlRKGyNpgZ7KdWdhDpEstL+TCA==
X-Google-Smtp-Source: APXvYqwR8DdTVAFjAIqdgYPHYDveml4zJbuXzWAAGKqsZUpKcEbD0sJt5SWRXnFR6IP80s+Fsbq8Ew==
X-Received: by 2002:a37:b484:: with SMTP id d126mr75623860qkf.342.1558631622684;
        Thu, 23 May 2019 10:13:42 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id y129sm10428193qkc.63.2019.05.23.10.13.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 10:13:42 -0700 (PDT)
Date:   Thu, 23 May 2019 13:13:41 -0400
From:   Sean Paul <sean@poorly.run>
To:     CK Hu <ck.hu@mediatek.com>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Hans Verkuil <hansverk@cisco.com>,
        David Airlie <airlied@linux.ie>,
        Uma Shankar <uma.shankar@intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-mediatek@lists.infradead.org,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        Shashank Sharma <shashank.sharma@intel.com>
Subject: Re: [PATCH] drm/mediatek: Fix warning about unhandled enum value
Message-ID: <20190523171341.GE17077@art_vandelay>
References: <20190522202207.223110-1-sean@poorly.run>
 <1558592000.552.3.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1558592000.552.3.camel@mtksdaap41>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, May 23, 2019 at 02:13:20PM +0800, CK Hu wrote:
> Hi, Sean:
> 
> On Wed, 2019-05-22 at 16:21 -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Fixes the following build warning:
> > drivers/gpu/drm/mediatek/mtk_hdmi.c:327:2: warning: enumeration value ‘HDMI_INFOFRAME_TYPE_DRM’ not handled in switch [-Wswitch]
> > 
> > Introduced with the addition of HDMI_INFOFRAME_TYPE_DRM in the commit
> > below, but the code really should have been future-proofed from the
> > start.
> 
> Acked-by: CK Hu <ck.hu@mediatek.com>
> 
> > 
> > Fixes: 2cdbfd66a829 ("drm: Enable HDR infoframe support")
> 
> I think "drm: Enable HDR infoframe support" exist only in drm-misc tree,
> could you just merge this patch to "drm: Enable HDR infoframe support"?

Yes, I've applied it to drm-misc-next. Thanks for your Ack!

Sean

> 
> Regards,
> CK
> 
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Cc: Shashank Sharma <shashank.sharma@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
> > Cc: Hans Verkuil <hansverk@cisco.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > index e04e6c293d39..10cc9910f164 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> > @@ -341,6 +341,9 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hdmi *hdmi, u8 *buffer,
> >  		ctrl_frame_en = VS_EN;
> >  		ctrl_reg = GRL_ACP_ISRC_CTRL;
> >  		break;
> > +	default:
> > +		dev_err(hdmi->dev, "Unknown infoframe type %d\n", frame_type);
> > +		return;
> >  	}
> >  	mtk_hdmi_clear_bits(hdmi, ctrl_reg, ctrl_frame_en);
> >  	mtk_hdmi_write(hdmi, GRL_INFOFRM_TYPE, frame_type);
> 
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
