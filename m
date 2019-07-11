Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21E0565335
	for <lists+linux-fbdev@lfdr.de>; Thu, 11 Jul 2019 10:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbfGKIcG (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 11 Jul 2019 04:32:06 -0400
Received: from anchovy1.45ru.net.au ([203.30.46.145]:59947 "EHLO
        anchovy1.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728147AbfGKIcG (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 11 Jul 2019 04:32:06 -0400
Received: (qmail 12548 invoked by uid 5089); 11 Jul 2019 08:32:04 -0000
Received: by simscan 1.2.0 ppid: 12384, pid: 12387, t: 0.1091s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy1.45ru.net.au with ESMTPA; 11 Jul 2019 08:32:03 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id 5EAC120971BA7; Thu, 11 Jul 2019 16:32:00 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     gregkh@linuxfoundation.org, bhanusreemahesh@gmail.com,
        leobras.c@gmail.com, nishadkamdar@gmail.com,
        preid@electromag.com.au, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, devel@driverdev.osuosl.org,
        nsaenzjulienne@suse.de
Subject: [PATCH 0/2] Staging: fbtft: Fix probing of gpio descriptor
Date:   Thu, 11 Jul 2019 16:31:51 +0800
Message-Id: <1562833913-10510-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

GPIO probing and reset polarity are broken.
Fix them.

Fixes: c440eee1a7a1 ("Staging: fbtft: Switch to the gpio descriptor interface")

Phil Reid (2):
  Staging: fbtft: Fix probing of gpio descriptor
  Staging: fbtft: Fix reset assertion when using gpio descriptor

 drivers/staging/fbtft/fbtft-core.c | 43 ++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

-- 
1.8.3.1

