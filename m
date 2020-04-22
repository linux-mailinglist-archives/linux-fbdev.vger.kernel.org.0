Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4311B37F0
	for <lists+linux-fbdev@lfdr.de>; Wed, 22 Apr 2020 08:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbgDVGva (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 22 Apr 2020 02:51:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:46360 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbgDVGv3 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 22 Apr 2020 02:51:29 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pN2h002112;
        Wed, 22 Apr 2020 01:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587538283;
        bh=xHH/l5IrdHFYTRiX2rNO2DB4cQAYEEGc6+dz5aMcpY4=;
        h=From:To:CC:Subject:Date;
        b=XzRwmlXbQoKP8xl59m4DF0OvJUPHlXrZ/QNze/iQo7iAHCF4gT17mU5ojPYLYr0LQ
         koMONzA3I58Hwlyh01EEXi3loLZQ+CUPvI0/0PfoOMrtTUCjuluzHC184KsKlV7Wpo
         2M08XSgkuXoYyh/a6/KcsXbLwVpKkEeht946Nnz0=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03M6pNms039949
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 22 Apr 2020 01:51:23 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Apr 2020 01:51:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Apr 2020 01:51:22 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03M6pKUW100224;
        Wed, 22 Apr 2020 01:51:21 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv3 0/4] led-backlight cleanups & fixes
Date:   Wed, 22 Apr 2020 09:51:10 +0300
Message-ID: <20200422065114.22164-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

Changes in v3:

- "backlight: led_bl: fix led -> backlight brightness mapping": Simplify
  the for loop as suggested by Daniel

Changes in v2:

- Drop "backlight: led_bl: rewrite led_bl_parse_levels()". The patch
  changed the behavior, and the new behavior may not be wanted. So lets
  drop this for now.

- "backlight: led_bl: fix led -> backlight brightness mapping" will now
  use max brightness if LED's brightness is higher than highest
  backlight brightness level.

- Added reviewed-bys.

 Tomi


Tomi Valkeinen (4):
  backlight: led_bl: fix cosmetic issues
  backlight: led_bl: drop useless NULL initialization
  backlight: led_bl: add led_access locking
  backlight: led_bl: fix led -> backlight brightness mapping

 drivers/video/backlight/led_bl.c | 37 +++++++++++++++++---------------
 1 file changed, 20 insertions(+), 17 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

