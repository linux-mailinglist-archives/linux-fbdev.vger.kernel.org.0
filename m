Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8411B2697
	for <lists+linux-fbdev@lfdr.de>; Tue, 21 Apr 2020 14:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgDUMqn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 21 Apr 2020 08:46:43 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42728 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgDUMqm (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 21 Apr 2020 08:46:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkY4r123680;
        Tue, 21 Apr 2020 07:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1587473194;
        bh=vkwNLbWImYCxiRXcjhOVVpfLAdrgZzNABjmA4X4e09E=;
        h=From:To:CC:Subject:Date;
        b=MUL8n0GxVH/3Mm8XIkTsmWgC3xWnLsa4qHiZFLSKkp5QpVJ4ocvTWOqoBB5urcLrl
         47lWS9+KAQyPB9RHzOYarYS70CZzAlUT3j99u6TPSBKW0swm9ganwcubXTu62r6Rs3
         YsenriZ25m6u9kl3L2WOBUeZpGBXABVqVg7ZNmU8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03LCkYqo083937
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 21 Apr 2020 07:46:34 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 21
 Apr 2020 07:46:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 21 Apr 2020 07:46:33 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03LCkVx3037462;
        Tue, 21 Apr 2020 07:46:32 -0500
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
CC:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCHv2 0/4] led-backlight cleanups & fixes
Date:   Tue, 21 Apr 2020 15:46:25 +0300
Message-ID: <20200421124629.20977-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi,

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

 drivers/video/backlight/led_bl.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

