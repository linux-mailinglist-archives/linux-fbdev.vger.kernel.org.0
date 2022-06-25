Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF4055A9F0
	for <lists+linux-fbdev@lfdr.de>; Sat, 25 Jun 2022 14:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbiFYMZN (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 25 Jun 2022 08:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbiFYMZK (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 25 Jun 2022 08:25:10 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63E31CFC2
        for <linux-fbdev@vger.kernel.org>; Sat, 25 Jun 2022 05:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1656159903;
        bh=BbC2Ujyw3SxiHPKu0to4lYbvppWoQD7xyh2/MPFT4T4=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=XcMFc8AxaYmDJM0AsmwNQmkjHVlDmrlx7P8+MZTRl4+UK2NmuR6LPwfkPXNTSTjpX
         Cgv/Ckf9EbB7pHNTIGkspuJBunYcG7/OGdsT71oQGXXYVESD3o4T0Y9mFiNEU7DoU+
         JDrf9DlQsCDTGsddfduYWVRqgIiRZS/esPc5QaLs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.162.44]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mi2Jn-1nRbI61EYb-00e8a8; Sat, 25
 Jun 2022 14:25:03 +0200
From:   Helge Deller <deller@gmx.de>
To:     linux-fbdev@vger.kernel.org, daniel.vetter@ffwll.ch,
        dri-devel@lists.freedesktop.org, deller@gmx.de
Subject: [PATCH v2 0/4] fbcon: Fixes for screen resolution changes
Date:   Sat, 25 Jun 2022 14:24:58 +0200
Message-Id: <20220625122502.68095-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8T6s6KOBFGh0/wQU+YHBHWAI32zubnBuDC/QibyByoNb07U8Mlc
 wsKVSSQxnmM9IITx8Zgy/gbGHlHWo2/K2bqir4F/jAg2mz7eEkpa3NqRAdTtptHnEpoZsgC
 AxmsZOlIiNAjiuE+HfhkVIdDsbc6nyC6cNcIO3qONeNI9gyU/uZX6JK6ygP18/VQgJHehKL
 6OPdiOPZ1+tEpCbvuwDgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5ZsFTc9cKjg=:FPKvV13UBvMRrNDnWFQN/5
 JQDwwfGZ+uJiKs47FsyDJOfjFCjpPA9MWdLO0tWWDSoXVCAWWP38UncdvJeZc4lysQ0PUwyPD
 nIUtOQLCAhGeAe5CN7Lt0/8lDgWhEsmQ7NiC1E4ZVbUvkrq1/evwfHzMK3B5ls0L7SSIlD1bt
 SFrPurqbly8GyDF6gLUkEOsPSP83ezwfJyOfsbYTXJkgSe+pFqhmKaKd5bEisyRPYmvwcXM0L
 euwuqJUeij7sXj+yBdXeh4X+T4VsyhTS7WVnIR/u4ZH2LV9z7m/974BX7zoKFcOhxlq5qxxjB
 ekNcViyCxJJnOJL97V9m2bOOzwo1kAy2PekCbAiSVtzF1iIK3NCnWbCdUErVqXKwNYRX3sC6y
 kz6Xt5+jggLyWOKjVIltwSxmjs5vlNl2BA+KO1Xy01kuIt0+73WMarhZRkZ/VosCMQu5TpHFD
 DtZgEnlr8cHCJWG55Jd3f/an1XoKhU6Bzfah81zSfBThNJkVXMZc3umgk4WT58r42JtY6R7lC
 K9/aVlv5xoHKi9nY7K+hv38+F1JbnQH4uhfVKpTAfZvJF6PgbcZpTOb6OD9bi91NAxjvfpHE1
 jTJl3JvefzD+qW0wn3kzp7iO1vgvi+h4bmovRCO5wZQcJAifpFpvANPl+NrUiBTDMXWZE9aIQ
 37O3CBDBI/h+JNFi33YdxuR1vlkuM8ieLmrZECTb64CdDZ+bdNS7v51cLX1/y9JJVf6Lcn8+p
 k1b/dGhLbBVnxSISPQEI+m4EnLcof5GM38I77IvGIUbtTbcSlPPO0RWZ8kTGBGkehMjkTqSFU
 ZhMAculbvZuamMqtw1qOV0cbYlG5IwvellghSVeQKx+nDwt7ZmbSpwTHRBrXE6eTNf++ZPa/x
 uHnYMm0LbaFfoaUMljWcBN4Cc5dQuuW6081d9l33A4MkxlWTB9pymyrkG/LjvaygpoxPaxkdi
 WDbcLlY9isTzt1jcxndm6vpnIjfKiNGT099u6xt1rGA/ecOUvCptZrAhBEdvcgT8JAh3Que9b
 YAbovFE/BBLMjEPJwhFTozX/6o4btL52hw4p5c3WJkDiyRmBq1Dk2s0fVnQr1kup2k0l+4RUp
 uj2lm6TKBoMac6lmQNNhA+o5nl7SAhaKfOnXnPxEvCY9GZ2Qr3AYBCzUw==
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
screen resolutions changes with invalid input parameters, e.g.  configure
screen which is smaller than the current font size, or if the virtual scre=
en
size is smaller than the physical screen size.

Helge Deller (4):
  fbcon: Disallow setting font bigger than screen size
  fbcon: Add fbcon_modechange_possible() check
  fbmem: Fix input parameter checks for user-provided screen resolution
    changes
  fbmem: Catch possible driver bugs regarding too small virtual screen
    size

 drivers/video/fbdev/core/fbcon.c | 31 +++++++++++++++++++++++++++++++
 drivers/video/fbdev/core/fbmem.c | 14 +++++++++++++-
 include/linux/fbcon.h            |  4 ++++
 3 files changed, 48 insertions(+), 1 deletion(-)

=2D-
2.35.3

