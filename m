Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7F578F54E
	for <lists+linux-fbdev@lfdr.de>; Fri,  1 Sep 2023 00:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345735AbjHaWQJ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 31 Aug 2023 18:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjHaWQJ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 31 Aug 2023 18:16:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81ED2C0;
        Thu, 31 Aug 2023 15:16:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1942FB82428;
        Thu, 31 Aug 2023 22:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A00C433C7;
        Thu, 31 Aug 2023 22:15:57 +0000 (UTC)
Date:   Fri, 1 Sep 2023 00:15:54 +0200
From:   Helge Deller <deller@gmx.de>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-fbdev@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Justin Stitt <justinstitt@google.com>
Subject: Re: truncation in drivers/video/fbdev/neofb.c
Message-ID: <ZPERGqgkUwcWvr+4@ls3530>
References: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
 <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de>
 <ZPEEzkQcQOP9yVFF@ls3530>
 <CAKwvOdkXmEe46cG9Hn837215ghWA7UNKtg7ZQM8CpQcEQnoWfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdkXmEe46cG9Hn837215ghWA7UNKtg7ZQM8CpQcEQnoWfg@mail.gmail.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

* Nick Desaulniers <ndesaulniers@google.com>:
> On Thu, Aug 31, 2023 at 2:23 PM Helge Deller <deller@gmx.de> wrote:
> >
> > * Helge Deller <deller@gmx.de>:
> > > On 8/29/23 18:45, Nick Desaulniers wrote:
> > > > A recent change in clang made it better about spotting snprintf that
> > > > will result in truncation.  Nathan reported the following instances:
> > > >
> > > > drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will always be
> > > > truncated; specified size is 16, but format string expands to at least
> > > > 17 [-Wfortify-source]
> >
> > FYI, I've added the patch below to the fbdev for-next git tree.
> > [...]
> 
> This indeed makes the warning go away, but that's more so due to the
> use of strscpy now rather than snprintf.  That alone is a good change
> but we still have definite truncation.  See below:
> [...]

Nick, thanks for your review and findings!
Now every string should be max. 15 chars (which fits with the trailing
NUL into the char[16] array).

Helge


Subject: [PATCH] fbdev: neofb: Shorten Neomagic product name in info struct

Avoid those compiler warnings:
neofb.c:1959:3: warning: 'snprintf' will always be truncated;
   specified size is 16, but format string expands to at least 17 [-Wfortify-source]

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://lore.kernel.org/all/CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com/
Link: https://github.com/ClangBuiltLinux/linux/issues/1923

diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index d2f622b4c372..b58b11015c0c 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1948,49 +1948,40 @@ static struct fb_info *neo_alloc_fb_info(struct pci_dev *dev,
 
 	switch (info->fix.accel) {
 	case FB_ACCEL_NEOMAGIC_NM2070:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128");
+		strscpy(info->fix.id, "MagicGraph128", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2090:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128V");
+		strscpy(info->fix.id, "MagicGraph128V", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2093:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128ZV");
+		strscpy(info->fix.id, "MagicGraph128ZV", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2097:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128ZV+");
+		strscpy(info->fix.id, "Mag.Graph128ZV+", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2160:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128XD");
+		strscpy(info->fix.id, "MagicGraph128XD", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2200:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256AV");
+		strscpy(info->fix.id, "MagicGraph256AV", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2230:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256AV+");
+		strscpy(info->fix.id, "Mag.Graph256AV+", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2360:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256ZX");
+		strscpy(info->fix.id, "MagicGraph256ZX", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2380:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256XL+");
+		strscpy(info->fix.id, "Mag.Graph256XL+", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
