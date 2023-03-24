Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D65F6C86B6
	for <lists+linux-fbdev@lfdr.de>; Fri, 24 Mar 2023 21:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjCXUVj (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 24 Mar 2023 16:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjCXUVi (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 24 Mar 2023 16:21:38 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1801A94D;
        Fri, 24 Mar 2023 13:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1679689293; i=deller@gmx.de;
        bh=E9BMqo9lBZGXEwg2PUb0Zufl02v4+CAcR/9rAdCuTUU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=rtNnsKXNR64Pzgw/a8nT0xvJ0NWGxWwoSk3qIViU6UHlo/7mJrI7w5difThLpAEM9
         bQRDW94pMyg+H0a32mD2NjE5KxadqT40VK9DKVS7svcZJMkph5e0nLHSZFD/Nu1cYp
         cJ87uSBYVOJHusoQLRMwMG+e1eTYh0tbKTkGS4YPSUAmmn/m6TKm3xeO53AVRLP64+
         2ppgebuXEaqiY7VM0Hr4Mr07C1yDBdYWtpOKhtCOqMwJXXlqovfqusU6YEnWXZp/5A
         ZLIQgnd/e4BWKwlk4SgnE+b1TwItl73txdKdcFkGgPAjdLBH2E+qLkk6CM+pYzzHgL
         eUkwuGbZYSSHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ls3530 ([94.134.154.70]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1q5klT0CsU-00Qy5D; Fri, 24
 Mar 2023 21:21:33 +0100
Date:   Fri, 24 Mar 2023 21:21:31 +0100
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linux-parisc@vger.kernel.org
Subject: [PATCH] fbdev: modedb: Fix kernel crash in fb_videomode_to_var()
Message-ID: <ZB4GS3zT3oh/afkf@ls3530>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:U3wALWmYIslI01ZBe08wACKIFNWaCEIkUTnXCVATCKjTXfG6lys
 dPojHvfjJx6aNmBq50m5P+UF7GcHBUxPVK5wD3ZGw5Y8cWXrTqF3MCeUJJ5iO11zvmEw+JF
 eeRAIqTgvgMcBgNg/RPrMbdhk+tM8D+ppb7wRZCrj+OUbtYtNGBhHgWdNszKt9viGkt2lvt
 PFelu2PazE9m96Gd75kSA==
UI-OutboundReport: notjunk:1;M01:P0:fFGlGxGjhSs=;O/MptMQ3RhfzKS1K8sE29eEhuIh
 gwc3OxI+7hqWiAwsw0AObRGgq5XBEjiZ7qeobdPgQIksAKmKrF93J8mpo+MBHuHUjNFnoXzmn
 S6vqwe/Kl/Ddx/vGK2Z1VE7qrw17w0AT4VzX8u3TsnHxhbwOTrCQECHZlvqs3XBg7eK6ujUFj
 mRqZnaxh3vRw8yv1zQAnNkNBQaWDiSZhJP8NtgD6Q/Mw0IW/ILVMv+dzUX1ij6sfAJjgCSfDt
 BPNl+u28ktrglIwDIrr62oN1vEau+6vax/0kr5yuaGEaCXtWjVqPtS+al+1BNXgVTtXjLw4vy
 Bbv8vFcU/JsgTBwvEf1sELH6YlonHN8mD1ahZydNCWvik92i4ZDlB1eFYSxwwsnZ4kq6bLczw
 K0OiSL+DbEaMo336V7gmxbynmiYpWRA2Y3g7OwXehr20Ykb1AP2O22jo14h7WIm3ATciSL3WS
 B/opMwYLBSlNCpwJV+GJmZZTOXdUV6PcM+UEgR5Y1VwmBNm1R9E/p8X1s69zwKHlkcWcvRXvH
 hHwuHrPwk3pUa09hBjeF6Qqi2LcAoNKZ1sqcUQEufcnvmZZ3zV6XDLTt0GCD0HPauYgth4zoO
 zHjj8h0bDwEHTcq3BchZbFNOE6Y0U0nS7DGva6FB5GhjCAIEgdVT6ncgQ0YLdK+kFNwEGTiWx
 +sv9x8r8kdNmcysTGVGxs1r8Kp5f5z9PkKIpVVStH1uXJvAi/B4sZGn0bsn5l4rdN/+h3xXMb
 mtFmUdvTNAOux6uJSzT2khDmrH6I2hc2WlY7SKhnlGeW+p6CIWD1bR7YPZNg3Erf8WV3cxzAi
 nML9EPKhvn9Atlqh8X84LQ3gqlg4DqlVWFcbr5L/A8MeOy2A6jei7mcg3pMvzkr9VJMho12R2
 2U8vIiH8b+gxheLvPV0IwLoiIiY9hFNONjnAJe3olju7+xk9JBjSuKUneclx5IJcj/j/z13vH
 gAWyNkWzgqscWTX+5OOyKJJ1k6I=
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Fix a kernel crash in the fbdev modedb code which can happen if you boot
a system without any graphic card driver, in which case the dummycon
driver takes the console. If you then load a fbdev graphics driver and
start a the X11-fbdev the kernel will crash with a backtrace:

  IAOQ[0]: fb_videomode_to_var+0xc/0x88
 Backtrace:
  [<10582ff8>] display_to_var+0x28/0xe8
  [<1058584c>] fbcon_switch+0x15c/0x55c
  [<105a8a1c>] redraw_screen+0xdc/0x228
  [<1059d6f8>] complete_change_console+0x50/0x140
  [<1059eae0>] change_console+0x6c/0xdc
  [<105ab4f4>] console_callback+0x1a0/0x1a8
  [<101cb5e8>] process_one_work+0x1c4/0x3cc
  [<101cb978>] worker_thread+0x188/0x4b4
  [<101d5a94>] kthread+0xec/0xf4
  [<1018801c>] ret_from_kernel_thread+0x1c/0x24

The problem is, that the dummycon driver may not have a valid monitor
mode defined (which is ok for that driver), so the mode field in
fbcon_display can be NULL.

Fix the crash by simply returning from fb_var_to_videomode()
if the video mode field is NULL.

Signed-off-by: Helge Deller <deller@gmx.de>
Cc: stable <stable@kernel.org>

=2D--

diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/=
modedb.c
index 6473e0dfe146..6a670b9dbcb4 100644
=2D-- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -893,6 +893,8 @@ void fb_var_to_videomode(struct fb_videomode *mode,
 void fb_videomode_to_var(struct fb_var_screeninfo *var,
 			 const struct fb_videomode *mode)
 {
+	if (!mode)
+		return;
 	var->xres =3D mode->xres;
 	var->yres =3D mode->yres;
 	var->xres_virtual =3D mode->xres;
