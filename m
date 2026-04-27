Return-Path: <linux-fbdev+bounces-7105-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAaHDscv72mb8wAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7105-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 11:43:35 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D1470130
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 11:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6986303D2F4
	for <lists+linux-fbdev@lfdr.de>; Mon, 27 Apr 2026 09:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDC43B2FED;
	Mon, 27 Apr 2026 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="k0u5hPEQ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B35E2701CB
	for <linux-fbdev@vger.kernel.org>; Mon, 27 Apr 2026 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282846; cv=none; b=lwlAwoFicRV9j0+Ja2onkfLl0RKtJfT2VxUTLKmFv0qb/gEQOF9B70wYGFg4xB0AjWkckBp87zZ4UlL4Ts1F+oZF9squjjJ4OHkODArKnCGa+KuVnK8WyfmQp5LhM6xI0f7xohTJXdto0WJggI6/SfBXWsez28ZYvnT0iUM/SAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282846; c=relaxed/simple;
	bh=E725h7Q42mPWGPZN0HLKLjzgFaqEIK61hVAv6JC88vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=be4fYQJ3MsfBoGnkhW3Ifw37bJq300o/cIV4rc5lIq6ePZgB9sV1qcXMWgo1czMVbDWdAdZByujJvTqY+ysdcEEswfmYlj6UIfaSsHZPYBxu2Hj5+oPB8dTVqSF5YCQCCkXMwCKckJyZ3yoqts4TaO6B46P+FlCNTzsp8rr8jhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=k0u5hPEQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1488C1A343E;
	Mon, 27 Apr 2026 09:40:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D8F34600D1;
	Mon, 27 Apr 2026 09:40:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90C4C107222C6;
	Mon, 27 Apr 2026 11:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777282843; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k3AGsGSjsAqkFWTdEAPpfBhMkb7kN97LhnCntWK+11o=;
	b=k0u5hPEQMmNRorbJLBK3tzGnBsBAbJvs34AhxMc1vCXAZmx5mYpmt8srUi2mZJm7IqIvfv
	EiO4sRz43Dy6Q9S4OnERh5JpP0juZEdZ/ayXvFqQJxgRla/jfTAaxOE52s+FlDJSXo5nVL
	mUEhFa4X5soEb7qDXf8+bqx2n9P33ynGVUVJfLgjN/OotY09WdoI0sT5k1MZk0utSV7qmz
	fuXFJZBD4dhD+uB/noDhMjGsWDOSfGrSYUjHmuZXABI5wFxDMnb2lwrwVI8YMuElNj09k8
	gqWn0y39h6mRK8NoybzivUVJ9tllMf1bI6VEUaZrfzwuRJeyxzGKcu+0Kr2ESw==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Mon, 27 Apr 2026 11:40:33 +0200
Subject: [PATCH v2 1/2] backlight: cgbc: Remove redundant X86 dependency
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-backlight-cgbc-remove-x86-dependency-v2-1-da9f2375a34a@bootlin.com>
References: <20260427-backlight-cgbc-remove-x86-dependency-v2-0-da9f2375a34a@bootlin.com>
In-Reply-To: <20260427-backlight-cgbc-remove-x86-dependency-v2-0-da9f2375a34a@bootlin.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: A98D1470130
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7105-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gmx.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.richard@bootlin.com,linux-fbdev@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The backlight driver depends on the MFD cgbc-core driver, which already
depends on X86. The explicit X86 dependency for the backlight driver is
redundant and can be safely removed.

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/video/backlight/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index a7a3fbaf7c29..07905d2ba01a 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -260,7 +260,7 @@ config BACKLIGHT_PWM
 
 config BACKLIGHT_CGBC
 	tristate "Congatec Board Controller (CGBC) backlight support"
-	depends on MFD_CGBC && X86
+	depends on MFD_CGBC
 	help
 	  Say Y here to enable support for LCD backlight control on Congatec
 	  x86-based boards via the CGBC (Congatec Board Controller).

-- 
2.53.0


