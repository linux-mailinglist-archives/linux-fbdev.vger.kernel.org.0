Return-Path: <linux-fbdev+bounces-21-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85D7E8A47
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Nov 2023 11:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7EF11C208F2
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Nov 2023 10:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E726411713;
	Sat, 11 Nov 2023 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="pZLxDQfM"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7760312B74
	for <linux-fbdev@vger.kernel.org>; Sat, 11 Nov 2023 10:42:48 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C723AA6
	for <linux-fbdev@vger.kernel.org>; Sat, 11 Nov 2023 02:42:47 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9becde9ea7bso812719066b.0
        for <linux-fbdev@vger.kernel.org>; Sat, 11 Nov 2023 02:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1699699365; x=1700304165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDgHYbXQcqXOi8pgjjCFs89msy5Cd5Tn06zlqflQDL0=;
        b=pZLxDQfMMPGoJyHV3OuLrZpModlaTSVAMJ6G4Yo/kxPSZnPrMk/VXJwu2ssgffb+/R
         Zj6FZ4L5uFUpR7kJ5+J6jz90hBCKjL8V5+J7y+8ESBStJelNwX3xnNk50kG5mhupnd6j
         kfELC3UYqRTaQ/LRCGjEhrCOrqFVghNwlP2c4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699699365; x=1700304165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDgHYbXQcqXOi8pgjjCFs89msy5Cd5Tn06zlqflQDL0=;
        b=RLBXPgf/PF4e3oNn29CvU7wuVen8cIM1irRug/LKecqC4I/YTTmtuhE99i1dbVBTrf
         A5tyDLAQU6eB7um/fQqizGMRJjRuDuAjRDCw+LAZwiCxsLvZiD1jY5F7VMKBjZlXTPNz
         9Fu3Jpf9uMcviIDpvxvyXlC4Zq/SiqKI6q59baiFTzxPyArTt0vI957Ht0gMT5PiKjEA
         TLuAzK5UTnCsfxa5/14xNLZuPfoARnQleQw6rOZt3b/ki2qzd4ugaT8A+a7XICiywQ+5
         7kFYxU7MzWQMLdNPmWXHRXvB9GWkEcjDx84SR6tPCyhqDQaif1YfNK+BEu4S07CZRMH2
         D1Fw==
X-Gm-Message-State: AOJu0Yw0Bgus6qerN8YMTqXJzP0EzpswE44RSXQ0brVohd1ub/K3tCSl
	QN0YWPUU92dltyK5orRL4dD+YQ==
X-Google-Smtp-Source: AGHT+IGWjzXZAnVOpqEeTHo29O9vwepCgThZZ6Cih0GL59Twpo4NVs/EaN2y7j4ks3a/O63PR8CCEA==
X-Received: by 2002:a17:906:80c4:b0:9ae:50ec:bd81 with SMTP id a4-20020a17090680c400b009ae50ecbd81mr4311227ejx.21.1699699365597;
        Sat, 11 Nov 2023 02:42:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
        by smtp.gmail.com with ESMTPSA id ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 02:42:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Helge Deller <deller@gmx.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH 07/10] fbdev: imxfb: add missing spaces after ','
Date: Sat, 11 Nov 2023 11:41:56 +0100
Message-ID: <20231111104225.136512-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
References: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch error:

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/video/fbdev/imxfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 83497f6998f1..ad293dc44dbb 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -280,10 +280,10 @@ static int imxfb_setpalettereg(u_int regno, u_int red, u_int green, u_int blue,
 	struct imxfb_info *fbi = info->par;
 	u_int val, ret = 1;
 
-#define CNVT_TOHW(val,width) ((((val)<<(width))+0x7FFF-(val))>>16)
+#define CNVT_TOHW(val, width) ((((val)<<(width))+0x7FFF-(val))>>16)
 	if (regno < fbi->palette_size) {
 		val = (CNVT_TOHW(red, 4) << 8) |
-		      (CNVT_TOHW(green,4) << 4) |
+		      (CNVT_TOHW(green, 4) << 4) |
 		      CNVT_TOHW(blue,  4);
 
 		writel(val, fbi->regs + 0x800 + (regno << 2));
-- 
2.42.0


