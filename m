Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACD2560AC3
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Jun 2022 22:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiF2UAe (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 29 Jun 2022 16:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiF2UAd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 29 Jun 2022 16:00:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA96647C
        for <linux-fbdev@vger.kernel.org>; Wed, 29 Jun 2022 13:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656532825;
        bh=+PhE9gEb0wg52MazwR2KFiYIHZksA16xFvrhrwFiyUo=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=SvhoyemmIjtmO4igUqb5PX6RVybnQ391V9C+asZNG4CV+ZfwqtywzzJ+NAj4ofMkD
         ik8+jI/Ldhbe6rUzNeEwlgB51A6GP3zRXVxK4nrMNB5GKm1SRDb4Ym9XPoj9H9r5xt
         12rkB0XD6ohVfQQH7SdfuHuT5ignhPOZZQcL8wJY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.135.51]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1oMvFy0vYh-00Kfcr; Wed, 29
 Jun 2022 22:00:25 +0200
From:   Helge Deller <deller@gmx.de>
To:     daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Subject: [PATCH 0/5] fbcon: Fixes for screen resolution changes - round 2
Date:   Wed, 29 Jun 2022 22:00:19 +0200
Message-Id: <20220629200024.187187-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pvJPcA1LYSqt06HvIFX9cBbCycAVwyAe7HfD5+o0Z+mAdnqNMtM
 YYhl7x45j2i5u89w501lC5jUJDxEP1LIxh/4XI3HCumUo+7FvLwVIRINGpbMKICbKn0CjPq
 AxUZKKSIyaZI/lpGRyGJkfBwhQcWaOkEWB0yY767JnJ4LD24TbF5dUxVaI2upAEBiD3QN0o
 FtP1sHxYRKZloF3KX0Q/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sgzMoBZ5sIY=:avfGKEQiMPMbqdaGZa91BA
 qqEsm9Bstp5jwmyPVldQ/wN/vOSEIUiqIeDp8QMZt5aJRbif8KJYufdeTMFo80+jbfqfHrECc
 XtwvJlKYp4CDUD0f6YQg/aXVAlyyoe2ChoG48q7Qn1vkEVJqGGnxeh9L17dU99uBtR1ITZdxU
 67WZ2ZOqckzOXiyo8QpNN9t/6VEx4KCOS2dwCKdIjYZm3hShYHahAgTjQ1gaBDJ3meqF6j/TK
 E5lioz6M5/gLcr2StjzsZaJk3ClMx/9wZ0i73tjPPXAEnrPiMj94g6o+VKGucEXEdXWZxMni9
 yNrXh447/a7cL4gQHxf9w9MNQI7qhtQ+/jsapewfjkaXpAiDb0K5eZ9C+o9jcXj+w4yx1lNNO
 gCs5qXn5GR/LH0vFBON30iypNzTle9szKdZHl+qjhbisMDJcyfcLHelq9nZ0E/h4h3krJ99oW
 319S/ySld4rOQEzFL/1HWO83txPyIVY/Ur3c1kELEXpG4c1tVL7pAx0bpURITgOGXX1jBrI97
 rDKv+zEF+wdhWHQGfpVcQ9sa4JoXiPu/FjfUfjvMvsUmeaUgWzfwUb8F1gG1sik0NdAmPBFbH
 VkgHwYC2rXTXH1qDyXkDWuR30dZa29LdkQDgKfXNhUw09+QgwbSsrRxI6Z/ywkhejdRAYATa7
 qTYlMQXVrE44jeaF4Hii/vWrS6rwbpXGHpL+lCqDM3Zn7pzCfjDHBb0hZ1IIhUcc6x+ph+Uxd
 Svxe6Ps66sXCEp+QlgjuF0WjdIm9/8qqlvnjG/LuK9SpSQsibHkyeyc79DFYCK/9nicCNdenP
 Nj1tOfXzWWdjHSQ02IC7jUzazAQw4n0MJrCiCO8c1DKA2h5ZGqsZ2oO9+aCn25yuBBNn9O079
 PoTnubrmn7nV/yyqrUl8giNSwQfozpoT70vorILbLJNotg4atb0fYxtB9cX6WVn0wn1KGAZTv
 IrEyDBfcrNwlAGpY/t9mGDYtlvFt6p747XR03Q6iVjE/oQumVE/4iIvuYRV4TWSwb3isBPPQV
 15qzIQhJKsDIQI56CTEyM45T6rUnLnLMrpO1JW3Vw65Xxus8LR3WKjlxTT951HZPUnnoOAAKg
 McIaLI4wmlC0C4flBvlXT1eS40qdufjbzSt6j0JrRJHU1Jp1tLOrHs0xQ==
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

This series fixes possible out-of-bound memory accesses when users trigger
screen resolutions changes with invalid input parameters, e.g. reconfigure=
s
screen which is smaller than the current font size, or if the virtual scre=
en
size is smaller than the physical screen size.

Helge Deller (5):
  fbcon: Disallow setting font bigger than screen size
  fbcon: Fix up user-provided virtual screen size
  fbcon: Prevent that screen size is smaller than font size
  fbmem: Prevent invalid virtual screen sizes in fb_set_var()
  fbcon: Use fbcon_info_from_console() in fbcon_modechange_possible()

 drivers/video/fbdev/core/fbcon.c | 33 ++++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 15 ++++++++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 51 insertions(+), 1 deletion(-)

=2D-
2.35.3

