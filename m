Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6CC49C5BC
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Jan 2022 10:04:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbiAZJEE (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Jan 2022 04:04:04 -0500
Received: from relay037.a.hostedemail.com ([64.99.140.37]:23685 "EHLO
        relay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231286AbiAZJEC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Jan 2022 04:04:02 -0500
X-Greylist: delayed 567 seconds by postgrey-1.27 at vger.kernel.org; Wed, 26 Jan 2022 04:04:02 EST
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
        by unirelay11.hostedemail.com (Postfix) with ESMTP id 3476880F26;
        Wed, 26 Jan 2022 08:54:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 27CD060010;
        Wed, 26 Jan 2022 08:53:56 +0000 (UTC)
Message-ID: <e12b11d20e22123736e5d8728286947e971c489f.camel@perches.com>
Subject: Re: [PATCH v1 4/4] fbtft: Replace 'depends on FB_TFT' by 'if FB_TFT
 ... endif'
From:   Joe Perches <joe@perches.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Phillip Potter <phil@philpotter.co.uk>,
        Lee Jones <lee.jones@linaro.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Carlis <zhangxuezhi1@yulong.com>, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Michael Hennerich <michael.hennerich@analog.com>,
        Helge Deller <deller@gmx.de>, Andy Shevchenko <andy@kernel.org>
Date:   Wed, 26 Jan 2022 00:54:13 -0800
In-Reply-To: <20220125202118.63362-5-andriy.shevchenko@linux.intel.com>
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
         <20220125202118.63362-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.16
X-Stat-Signature: em88uec87srrhrfjxjnjwiqf8orq9fet
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 27CD060010
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19Vno09lLkNwZ/zyG+OKu9T1j1sTiaf0bM=
X-HE-Tag: 1643187236-759005
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Tue, 2022-01-25 at 22:21 +0200, Andy Shevchenko wrote:
> Replace 'depends on FB_TFT' by 'if FB_TFT ... endif'
> for the sake of deduplication.
[]
> diff --git a/drivers/video/fbtft/Kconfig b/drivers/video/fbtft/Kconfig
[]
> @@ -10,87 +10,75 @@ menuconfig FB_TFT
>  	select FB_DEFERRED_IO
>  	select FB_BACKLIGHT
>  
> +if FB_TFT
> +
[]
>  config FB_TFT_PCD8544
>  	tristate "FB driver for the PCD8544 LCD Controller"
> -	depends on FB_TFT
>  	help
>  	  Generic Framebuffer support for PCD8544
>  
> @@ -108,62 +96,52 @@ config FB_TFT_S6D02A1

Looks like you missed a couple.
---
 drivers/video/fbtft/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbtft/Kconfig b/drivers/video/fbtft/Kconfig
index 14ea3c6a60da0..4a02871f2cc71 100644
--- a/drivers/video/fbtft/Kconfig
+++ b/drivers/video/fbtft/Kconfig
@@ -84,13 +84,11 @@ config FB_TFT_PCD8544
 
 config FB_TFT_RA8875
 	tristate "FB driver for the RA8875 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for RA8875
 
 config FB_TFT_S6D02A1
 	tristate "FB driver for the S6D02A1 LCD Controller"
-	depends on FB_TFT
 	help
 	  Generic Framebuffer support for S6D02A1
 

