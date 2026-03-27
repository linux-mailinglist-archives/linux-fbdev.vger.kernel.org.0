Return-Path: <linux-fbdev+bounces-6724-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CiCBCjexmkoPQUAu9opvQ
	(envelope-from <linux-fbdev+bounces-6724-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2026 20:44:40 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E8F34A55A
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2026 20:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ED5DD3010936
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Mar 2026 19:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2342D38F247;
	Fri, 27 Mar 2026 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eVdnPTcZ"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B205B386579
	for <linux-fbdev@vger.kernel.org>; Fri, 27 Mar 2026 19:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640386; cv=none; b=RTOoCJ8oNiR8gbSd/u/BPSer4ZonsAMjNf7RBk9wp5MYRNSc+XfnldaFKh8bOuhy2aH7TgMvUSf+d4BcY6HFeQqUu4xbb7F7Wek0x2IzPH+6pAhTPveCeYW8iXIuqpcgeH4uM77sbIqa1/aKwIUBgjLkBme9cSYzoGdM/rBLep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640386; c=relaxed/simple;
	bh=8gLWs++EdOUBSlrPiLW6GRenO1dTS0Abli6P3iqQshc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5n85GV4P/Vi9lru72Ak4KD3nQc1Da4FPOk599907KkDPkJ7rDvhMe5lTYtuIqhqx/1mSrmhbM93Axfmi2fWcgg9mCcEkCeDG/o0z5kx0iEZ6iFlJiScHAu0vtv14JNdfcAtEB4CQ7lcOudGnxRbS7iKovlzqNnp8q1pV9hUSQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eVdnPTcZ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F40E41A3027;
	Fri, 27 Mar 2026 19:39:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB4C560268;
	Fri, 27 Mar 2026 19:39:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CC9510451AF7;
	Fri, 27 Mar 2026 20:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774640379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iPhjjyjp+Si4/Cjy/AMZxhHDxGFBbRdehdgcpegxNhA=;
	b=eVdnPTcZkj+yEj+kOYZQgIHDfPsyXxufKYE1hut4TMxt3NM+syBTvsnfHfki5xAxKw0TYb
	pVaA6k0MroVQJVzX0yRelI6abyD6qY3OjvYbO5GsqYvZpTG17++BNyNQyKk6/aFY38K6tV
	2BLr+iunWEjVQVERH1tpYO94ymvlmf70n7oWSk9v1XsNvh6HNjwHrvZrWi8pONRqKklNQv
	yo7OfLK//TMbEHuu3FoYVTLM7aL9BWjAqNrrzYn/bPDdkaXaX4gRPcOBcjE8lWgCOUflWl
	bFeENandoV7derxAKoG2gBclILlBXx/ysw4Z1QEPROSpjUFxo42TdS1hP2mnkg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Fri, 27 Mar 2026 20:39:32 +0100
Subject: [PATCH 1/2] backlight: cgbc: Remove redundant X86 dependency
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-backlight-cgbc-remove-x86-dependency-v1-1-4851c9e95371@bootlin.com>
References: <20260327-backlight-cgbc-remove-x86-dependency-v1-0-4851c9e95371@bootlin.com>
In-Reply-To: <20260327-backlight-cgbc-remove-x86-dependency-v1-0-4851c9e95371@bootlin.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6724-lists,linux-fbdev=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: 08E8F34A55A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The backlight driver depends on the MFD cgbc-core driver, which already
depends on X86. The explicit X86 dependency for the backlight driver is
redundant and can be safely removed.

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


