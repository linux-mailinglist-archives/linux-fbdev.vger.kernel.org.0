Return-Path: <linux-fbdev+bounces-6472-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPsEGYrxp2mGmgAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6472-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 09:47:06 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3CE1FCD3F
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 09:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 127F53034E2C
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Mar 2026 08:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BB83932C8;
	Wed,  4 Mar 2026 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD+X9K0I"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA648388381
	for <linux-fbdev@vger.kernel.org>; Wed,  4 Mar 2026 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613982; cv=none; b=A4LuD59vppxL/8HqNFPzAUJcJZzFgTu0wvkeA4gtA70amuKx/JMDk81IHSdpLCvAM34OLpajqQL2f2cPMtPK6kkDaX5ZqVJ6/gwVPQGDD1X9kW1C4M3qaM9BzVpx5uIZ8O+0lWIj/Xaiwy7EhBGqYQ14bUP+DwlKPIuUFI0VGQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613982; c=relaxed/simple;
	bh=NjIHanfcZCN7Q8bPlLToej7iNBvOlqyNwUhyWxKm2yQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FVNfoMLuNbrSf1oS7/WjzyPRkKczgWycKRHPsIrJ8K3tp42G73urM9MvHjonhLX+aZmdnn06zkRkpeBYBdMq+XFZGuZTaMZNawR0G+KEf8z5u6WYKn8JtgQUpLy3PXQd2ON5cLlzN0hBtcN24/h3C4RBaz45RVPEamtjAkEy4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GD+X9K0I; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c73770b3f15so116746a12.2
        for <linux-fbdev@vger.kernel.org>; Wed, 04 Mar 2026 00:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613981; x=1773218781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4Tsr0TiaAL9EgCXS3kDx+w3w2NKKVy8Enr91haZmsQ=;
        b=GD+X9K0I6Sv8qPDaWsAwEtRUJQx3PtLe0zojOAcXxC/EBcJR6gWO6pGKt2q7p+pRVc
         ViFtBPkkRypkiRy0LEb77kvjt36tZ6TWFAM3GA9Hwgg8znj/kuZOGIRVn0FzXqmakbEK
         P2pFxysOHTZ6sbh+YXCfaGCBTyRWse5gXzYLyT1od8R499zU/IBUgiuUir+XhpMG63Kw
         GcfSCawUPiMMLUQ9H8uRfIyg+cc8lpU9vdBi8E8cfcP6QY5yq0Dhi1/QKm4kfgmAfinO
         t7zlQph5KmXDp87AYG/SmesI5rjmb0wqX3qtQBobhaD9c9ZeNkx8ClJcmXpvEm+/sgPu
         txpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613981; x=1773218781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4Tsr0TiaAL9EgCXS3kDx+w3w2NKKVy8Enr91haZmsQ=;
        b=Sm+JtUfuSMY+zu/JDbQkvZFdwPpivo5ydkjEqWUVV8+neIvNXnRXLQHN1tIsBI/Y+L
         zAtLDxi5leg9f7GPBjaUg3+TnzYznafF1qDkWsM7TqHJDvmlK0UZj66wzSLgaYLO5sED
         bsX1ogl/mNts0zqMcscOArskK8KNatFhypcQkhxCo0mAG9YpmBEtnMC0m88miPe8oHMj
         OqSGaxXv5h7dTZTmw5TZWyFVQmTRcASy4VQOcMA87BEWAcl9SgGRGlquisQGmrvJFjLI
         AcACTF1gBoLCBcMmzLigOCoTGWsgA8A7Ow3EWvjT2Puw+zEdRiTtPoKyDQuHp4IAx64p
         mrpg==
X-Forwarded-Encrypted: i=1; AJvYcCUWe+aoPXIg9kJdHqhx1LFtRz+ef6LZ+s0IeuX/50kWvxJhqjh42bEda0yk2ilLXWeT056gIumrRBoWKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE/I6DmK6PCjhfjV3hpuWhOmHImbNsrTV4rS47tiPCYmwcEr2g
	BB4DNLCLXhU8LzIiodf5GAaIQPnDEAU+40jXQQHkX8WxloILxXCeBRxv
X-Gm-Gg: ATEYQzw84jkYvbT2c+Go9ACfA1XnBETJ8wP/XITmjOUb1ucIbJ9cDVKPn6MwdQv/Sky
	1LuoY2X3CJuPM4qVxdNdGlsgHl32HHyvScqiNCNykOF0D/K75RuSGY2DAEHQ6mR1DgYkSvgolGJ
	2aLykHdLiA1e61lAbHSvfBU4xJTLBMDy0o18kAFP2rxN9yVExIMCHxaxN9c3/bXGEiL38XZ7GwX
	EsA+GyrpNCT+ZhNcctmvDRK+Jph81n6YRajSdu4NARa4kxwp7kgUFwxeRJIDJOBewAF6amd94D0
	QcHSXn+CHUbMwk+wKIR9zvRV2xH2+vW7FLI35Ziw+fG1LHt4F8EKVXl1O7gzBNB/c+Z3TDf8jDU
	yk8Or3DJSSgn0yCkTK5vSyKHDAYKuXDmIP6bQLad4LQsATC7WeROmvnRhNJ6f1ir2oKU9LKLX0/
	sWWMSSa6ishyRIPFtqMY3UBS2x2U3MpkotYJD6PoTy/n+KPsGNdOkEPTCPZuraF0xOl8pNoJXzG
	15hytCsYJ1hDrE=
X-Received: by 2002:a17:903:2c50:b0:2a9:5b48:2b1f with SMTP id d9443c01a7336-2ae6a89797fmr10736535ad.0.1772613981282;
        Wed, 04 Mar 2026 00:46:21 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:21 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 6/6] staging: sm750fb: sm750_sw_i2c_init: return -EINVAL for invalid GPIO
Date: Wed,  4 Mar 2026 14:15:45 +0530
Message-Id: <20260304084545.156170-7-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6A3CE1FCD3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6472-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[officialsohamkute@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Return -EINVAL instead of -1 when the GPIO pin number is out of
range. The caller checks for non-zero return value as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index a17f758dda6c..d90a93ab8fdc 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -394,7 +394,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * range is only from [0..63]
 	 */
 	if ((clk_gpio > 31) || (data_gpio > 31))
-		return -1;
+		return -EINVAL;
 
 	if (sm750_get_chip_type() == SM750LE)
 		return sm750le_i2c_init(clk_gpio, data_gpio);
-- 
2.34.1


