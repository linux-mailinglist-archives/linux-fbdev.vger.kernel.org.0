Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5CD6BD161
	for <lists+linux-fbdev@lfdr.de>; Thu, 16 Mar 2023 14:51:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjCPNvF (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 16 Mar 2023 09:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbjCPNvE (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 16 Mar 2023 09:51:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD3FB048A
        for <linux-fbdev@vger.kernel.org>; Thu, 16 Mar 2023 06:50:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 093CC62018
        for <linux-fbdev@vger.kernel.org>; Thu, 16 Mar 2023 13:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54CC7C4339E;
        Thu, 16 Mar 2023 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678974655;
        bh=lXUl7La5cJcJdgZLmoOZmsmMW91Ldc6U+hd0ZTgsng8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ig9GWJb6NXq5yRP3ueSxciQWa7tpd/uiQwIrYL/9GSs0OOkGuG04h0P2XMqVFDA24
         A6CjmJu28EymnJXEHNrKUfP9B8CyMv0xJGsG43kRXLNR8QtZE/VdFTYfvN8ORTgCcb
         D8GL1jtvpFsTxP6GbOCMfuHABUBRcmZo/zWqYfkXTZi/LePFnfOCedLE0cTBVB7v24
         OZP7PQx+/7Wanoq7TCNtmV81HBzhjcajY++kGBmHtDOl3syQTZOfI4WellVgQ01cZh
         oYvc+uPZUwnt8UzWONxW2C1zb+WH3b7hLSQ+yM6G+xAXat+gIZ6L+sDF5x053rsMiP
         U270LzOAPLyNg==
Date:   Thu, 16 Mar 2023 13:50:50 +0000
From:   Lee Jones <lee@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 09/13] backlight: mt6370-backlight: Convert to platform
 remove callback returning void
Message-ID: <20230316135050.GX9667@google.com>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
 <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308073945.2336302-10-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Wed, 08 Mar 2023, Uwe Kleine-König wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/mt6370-backlight.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied, thanks

--
Lee Jones [李琼斯]
