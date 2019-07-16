Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DC869FC6
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Jul 2019 02:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732317AbfGPAZH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 15 Jul 2019 20:25:07 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:45285 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732200AbfGPAZH (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 15 Jul 2019 20:25:07 -0400
Received: (qmail 25523 invoked by uid 5089); 16 Jul 2019 00:25:04 -0000
Received: by simscan 1.2.0 ppid: 25478, pid: 25481, t: 0.0488s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 16 Jul 2019 00:25:04 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id E4261200A395E; Tue, 16 Jul 2019 08:24:59 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     gregkh@linuxfoundation.org, bhanusreemahesh@gmail.com,
        leobras.c@gmail.com, nsaenzjulienne@suse.de,
        nishadkamdar@gmail.com, preid@electromag.com.au,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 0/2] Staging: fbtft: Fix probing of gpio descriptor
Date:   Tue, 16 Jul 2019 08:24:35 +0800
Message-Id: <1563236677-5045-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

GPIO probing and reset polarity are broken.
Fix them.

Fixes: c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor interface")

Changes from v2:
- Add fixes tag to "Fix reset assertion when using gpio descriptor"
- Add tested-by / reviewed-by tags

Phil Reid (2):
  Staging: fbtft: Fix probing of gpio descriptor
  Staging: fbtft: Fix reset assertion when using gpio descriptor

 drivers/staging/fbtft/fbtft-core.c | 43 ++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

-- 
1.8.3.1

