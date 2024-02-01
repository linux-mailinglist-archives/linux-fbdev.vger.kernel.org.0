Return-Path: <linux-fbdev+bounces-852-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 528438451C8
	for <lists+linux-fbdev@lfdr.de>; Thu,  1 Feb 2024 08:12:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06DC2283B15
	for <lists+linux-fbdev@lfdr.de>; Thu,  1 Feb 2024 07:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697DC1586C4;
	Thu,  1 Feb 2024 07:12:22 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69788157E94;
	Thu,  1 Feb 2024 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706771542; cv=none; b=Gr2gvXJLYVVmaQphbi5HhOMiZ6dVWz8ThvXMuUab8K8ogc+OFu0ct31ylSZuDEWcvlODODwAkLId7Xz9S1XI4BnhvCpxRhEf3HvKTXf05maeyL8eoqEjH9fyA8L1a/biPWf9JxJbSvNsRb0tfcf1G3iMx1tUxS/CkAQixlUlX0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706771542; c=relaxed/simple;
	bh=9pSdTqppayXVg8e6uEt07WBrfPZEDwNrE4b0Y5LSgg8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WvDoHgWvKjaw4ayz0TGqG7nMqT9e1w79fQzICL+E6+9MWli8QcoPXfMkKSQYJfBi91TM9gEYba3pyG+SgOChbV1+BfYg04gpxsr4D6RFb7UivFfHVMEwlB0funamwhi++6rid8Uo5g28FSdyz1x3ZfoG3W6KyTB/RstQ2e4ZRbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 65cdf20534ff4e049a204efcd879dd7c-20240201
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:1eff9a06-e204-4097-8ba7-f29e89d81adb,IP:15,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:1eff9a06-e204-4097-8ba7-f29e89d81adb,IP:15,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:4972e68e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:240201150131SZXINURA,BulkQuantity:0,Recheck:0,SF:19|44|66|24|17|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_ULS
X-UUID: 65cdf20534ff4e049a204efcd879dd7c-20240201
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw
	(envelope-from <liucong2@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1121363701; Thu, 01 Feb 2024 15:01:29 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: Helge Deller <deller@gmx.de>
Cc: Cong Liu <liucong2@kylinos.cn>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev/sh_mobile_lcdcfb: Replace deprecated simple_strtol with kstrtol
Date: Thu,  1 Feb 2024 15:01:27 +0800
Message-Id: <20240201070127.3290465-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces the use of the deprecated simple_strtol [1] function
in the sh_mobile_lcdcfb.c file with the recommended kstrtol function.
This change improves error handling and boundary checks.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index eb2297b37504..5fc7d74b273e 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1278,11 +1278,11 @@ overlay_position_store(struct device *dev, struct device_attribute *attr,
 	int pos_x;
 	int pos_y;
 
-	pos_x = simple_strtol(buf, &endp, 10);
+	pos_x = kstrtol(buf, &endp, 10);
 	if (*endp != ',')
 		return -EINVAL;
 
-	pos_y = simple_strtol(endp + 1, &endp, 10);
+	pos_y = kstrtol(endp + 1, &endp, 10);
 	if (isspace(*endp))
 		endp++;
 
-- 
2.34.1


