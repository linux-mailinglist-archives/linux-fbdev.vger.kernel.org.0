Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF8DA275E7
	for <lists+linux-fbdev@lfdr.de>; Thu, 23 May 2019 08:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbfEWGN2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 23 May 2019 02:13:28 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:10953 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725873AbfEWGN1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 23 May 2019 02:13:27 -0400
X-UUID: fbae2d38e97c4c139052c44cb752bc31-20190523
X-UUID: fbae2d38e97c4c139052c44cb752bc31-20190523
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (mhqrelay.mediatek.com ESMTP with TLS)
        with ESMTP id 281682636; Thu, 23 May 2019 14:13:21 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 May 2019 14:13:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 23 May 2019 14:13:20 +0800
Message-ID: <1558592000.552.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Fix warning about unhandled enum value
From:   CK Hu <ck.hu@mediatek.com>
To:     Sean Paul <sean@poorly.run>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-fbdev@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Hans Verkuil <hansverk@cisco.com>,
        David Airlie <airlied@linux.ie>,
        Uma Shankar <uma.shankar@intel.com>,
        "Sean Paul" <seanpaul@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-mediatek@lists.infradead.org>,
        Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        "Shashank Sharma" <shashank.sharma@intel.com>
Date:   Thu, 23 May 2019 14:13:20 +0800
In-Reply-To: <20190522202207.223110-1-sean@poorly.run>
References: <20190522202207.223110-1-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi, Sean:

On Wed, 2019-05-22 at 16:21 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Fixes the following build warning:
> drivers/gpu/drm/mediatek/mtk_hdmi.c:327:2: warning: enumeration value ‘HDMI_INFOFRAME_TYPE_DRM’ not handled in switch [-Wswitch]
> 
> Introduced with the addition of HDMI_INFOFRAME_TYPE_DRM in the commit
> below, but the code really should have been future-proofed from the
> start.

Acked-by: CK Hu <ck.hu@mediatek.com>

> 
> Fixes: 2cdbfd66a829 ("drm: Enable HDR infoframe support")

I think "drm: Enable HDR infoframe support" exist only in drm-misc tree,
could you just merge this patch to "drm: Enable HDR infoframe support"?

Regards,
CK

> Cc: Uma Shankar <uma.shankar@intel.com>
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
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index e04e6c293d39..10cc9910f164 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -341,6 +341,9 @@ static void mtk_hdmi_hw_send_info_frame(struct mtk_hdmi *hdmi, u8 *buffer,
>  		ctrl_frame_en = VS_EN;
>  		ctrl_reg = GRL_ACP_ISRC_CTRL;
>  		break;
> +	default:
> +		dev_err(hdmi->dev, "Unknown infoframe type %d\n", frame_type);
> +		return;
>  	}
>  	mtk_hdmi_clear_bits(hdmi, ctrl_reg, ctrl_frame_en);
>  	mtk_hdmi_write(hdmi, GRL_INFOFRM_TYPE, frame_type);


