Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCFC853BF53
	for <lists+linux-fbdev@lfdr.de>; Thu,  2 Jun 2022 22:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235464AbiFBUIs (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 2 Jun 2022 16:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238829AbiFBUIr (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 2 Jun 2022 16:08:47 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28773A1BB
        for <linux-fbdev@vger.kernel.org>; Thu,  2 Jun 2022 13:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1654200520;
        bh=MWdsFO0Da7lpg/6VkR6yrv6S008xzfO8/q3kNEiYJGM=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=giIqeTa0rELXJlbOGCzv2gUnTIWLop8tmTvxkzDq4u+Gw1uFD55zOUPMCVwPoaF5F
         eu+R5WEm/ioaiHPas2d6DN/ce9E2qqymjwFPcfdC9Sj8EWFcoPJNZanZ4n3HxI/imN
         NctUZSEyuAMjVMUErWLGuNnbqt5P8YOJP6Faoq6g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.181.14]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N33Il-1nmuzF0Ttd-013MdC; Thu, 02
 Jun 2022 22:08:40 +0200
Date:   Thu, 2 Jun 2022 22:08:38 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbcon: Fix accelerated fbdev scrolling while logo is still
 shown
Message-ID: <YpkYxk7wsBPx3po+@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:hVfaPk/9jZny26PcD/WxhWiObtc1MLuJNdonRgwBiVzzDnIV7SK
 UoSuD0ggVXDDKP2Tn2USwM7ZrUl6zb88GkTZERFK4sKl+i0SlUq2Py5WnNfrt4Carg1hroW
 N/dyy4J9X5IsA39mp767lUk9hKA9Tgf3hBKpXsMjOFJAaq751L2toavGTqHStSHi4QjhqDr
 c5Xb8j0z5+edI4jeE9EYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0WOHpmXwUx0=:5r2dFs4uvkyMP/n1t9ledo
 veQcGH68JUzpjkanLCv8ZStH//t4BBPvILVjqoTEMtxp5RqPzUbhXrYx3UcMCms12XZCrS5CQ
 S+8DwEYGA3fARlRS6rIdJD1eq5231Tvomd6GHGvmzz0ffFEfOZ+74PkidF98qgOrGypnhTMh7
 WjuyN6RYx5k/4N0KY43oXLBIkf7pxmDpbXoQusgfuHJz6zXsLV+pA60e/VpwPIDVQJ7aZjodA
 bGAPH/DyLU8ZQyVbP20UZzytE+AmO+3uetxL4RCacOB5FFI+WqpymH/F7cLVlXtRYOoNpTus/
 HFjLllfxN8Ec6nBDtTIZR9Sw9GvoOAZIl5V8Ifk3VVkMo3RFyVeEzbP2Oc0DikBv4pdKstNpL
 oHC8mqhdk2WyXcii6QC6dSrNJZqwqMbN8Q0B4PI+9Gc7UnDkts8vP0RP8vwLsBJq4UlOJ983g
 JHssvAkUxLX+d57PMhle9eLKG2XZukfZ/o5o0P1B9AJFBdsv4/hZaSbGrW/Tg55qvd300kSsk
 5fgkmHhqJQD/n4CFMZADVA9RpuBV5IVe8SOhJPFUd2fuL1eVx2Y0lYQZ40umoMNl0mcUqMTD1
 /kL6vwCObiZIj+4sV4JkLq0HQIlzezuo0zjB2HfhbE4i0v2ypmsUXcdRMSCCmbZ1hfwAtdon5
 SPsfEpkIj5BRRx/F+n3vU0DXmZJgTQHVV3OJUO+zx7C0OtEt5YToW8VYYNg37PwKFvh78MG8Z
 DjVy3YTctp5AguJqXoQitvze1SFIMZvvujtIddCzI7b7ih1gPO5tUralw1DU2g15YUiBUw2ef
 Sa6g2im3la33Ye3RImdlSnKRyvSEbU1OpCP2OAbSWQism4vWkAlryJqPnQYU8qSZHEUPXWp2q
 mmS3XUp7A5Pa2QfpklKRNXGhYzDO1ztJTsaQ8k+tOee4RnByW8DQCIfvwUX3M3iY12w9BAx/9
 hgigysppmkJ+SnsEfkEPfTGP80SLm0LxZs0rrF/R9mcRm8PSysd42nHLXznAXaXcB+ZLkbTy8
 VpLZlzseQint1oZBZ4icKKI3uxwW4y1CXGKOjKqMNLNG7GHqJAAIjO60JAGDCFPeRG0mwVipp
 iWT1r0eaZGh/9gd4BQauhI63poMviL9SXrZ
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

There is no need to directly skip over to the SCROLL_REDRAW case while
the logo is still shown.

When using DRM, this change has no effect because the code will reach
the SCROLL_REDRAW case immediately anyway.

But if you run an accelerated fbdev driver and have
FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION enabled, console scrolling is
slowed down by factors so that it feels as if you use a 9600 baud
terminal.

So, drop those unnecessary checks and speed up fbdev console
acceleration during bootup.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable@vger.kernel.org

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index c2f9e5711c39..8eb5b73e98bc 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1706,8 +1706,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 	case SM_UP:
 		if (count > vc->vc_rows)	/* Maximum realistic size */
 			count = vc->vc_rows;
-		if (logo_shown >= 0)
-			goto redraw_up;
 		switch (fb_scrollmode(p)) {
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, t, b - t - count,
@@ -1796,8 +1794,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
 	case SM_DOWN:
 		if (count > vc->vc_rows)	/* Maximum realistic size */
 			count = vc->vc_rows;
-		if (logo_shown >= 0)
-			goto redraw_down;
 		switch (fb_scrollmode(p)) {
 		case SCROLL_MOVE:
 			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
