Return-Path: <linux-fbdev+bounces-7244-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gP/QE5ByBmqyjwIAu9opvQ
	(envelope-from <linux-fbdev+bounces-7244-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 May 2026 03:10:40 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7354844B
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 May 2026 03:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51ACA303FA85
	for <lists+linux-fbdev@lfdr.de>; Fri, 15 May 2026 01:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F48E30170F;
	Fri, 15 May 2026 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="mqc3bCRF"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from outbound.baidu.com (mx15.baidu.com [111.202.115.100])
	by smtp.subspace.kernel.org (Postfix) with SMTP id A97A126ED3E;
	Fri, 15 May 2026 01:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.202.115.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807437; cv=none; b=XVwfopzvuGGX5xOmTgRGeRIFfjxY/zrGLvtvnEDuMRx9dMA4dasInztOTMtbFKzVR465bYXS9R7mX4bMyKcQydpXKZdLE0NA8L7Y2xfoVXnkaoQJJ57+OhdMzcz8UxnksGCU40NC+aT2BOVsaGBy1IAb3B9CVCPwuoTdMTelq0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807437; c=relaxed/simple;
	bh=kJWh4w5vZCjf/kZGYMO1H5ykydBwztdkarrI35PKxFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J74SnsFDaB4zem5aoTmB6054qbUplfW7IZgxYqRTyB1y4cqjcdqDfRpxAW7KIaRgjAJgsllLA/THBLaNsQY+ySwHVgjKS1pJN3SR77ugGhXTHpS8AEfLCeCp9rupk0xLlH1wmrLQTOHM5o5G35yYUher109jfO5/JxP/O8LIRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=mqc3bCRF; arc=none smtp.client-ip=111.202.115.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Teddy Wang
	<teddy.wang@siliconmotion.com>, Helge Deller <deller@gmx.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, <linux-fbdev@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>
Subject: [PATCH] video: fbdev: sm712: Fix operator precedence in big_swap macro
Date: Thu, 14 May 2026 21:02:02 -0400
Message-ID: <20260515010202.2506-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc3.internal.baidu.com (172.31.50.47) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1778806934;
	bh=O6Y4gE06UetHw8c2Elza5KyEZBIyhBBNgcSOAK46jGk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=mqc3bCRFxyXrye9YxL/vMYDn5vvs0gzhk7KdA9qr9PnYAH7URMlgicdsY4eUqY8xn
	 7uKsmZK9Vw6/6ENQiXBfImaU+WxP7UPyVXyBwg9fdF34hsDvyGKbHkrwfyoiHIKqLw
	 Z4kdPJhgYpJu/yKxMo2ofu/xo93yKX1+lIYJcrU+PM9NBo3ZjaE1EHkcTuVM10AANZ
	 A+2Sm3BVWscH9J7R4r9DQveAZQnM8ukEPbE8U08iBsDwbTFcDTDQ9cjeZi+N+pSvJm
	 UDhK+ZCC17bUbon+J0UhEqpgipnEkHsa2ti0l6cMd0DGR6NnxcK7H9Nwhs6atwCWtL
	 k45qNYGpWGj0A==
X-Rspamd-Queue-Id: A5B7354844B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[baidu.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baidu.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,gmx.de,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-7244-lists,linux-fbdev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lirongqing@baidu.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baidu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Li RongQing <lirongqing@baidu.com>

The big_swap(p) macro was intended to swap bytes within 16-bit halves
of a 32-bit value. However, because the bitwise shift operators (<<, >>)
have higher precedence than the bitwise AND operator (&), the original
code failed to perform any shifting on the masked bits.

For example, 'p & 0xff00ff00 >> 8' was evaluated as 'p &
(0xff00ff00 >> 8)', effectively neutralizing the intended swap.

Fix this by adding parentheses to ensure the bitwise AND is performed
before the shift, correctly implementing the byte swap logic.

Fixes: 1461d66728648 ("staging: sm7xxfb: merge sm712fb with fbdev")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 drivers/video/fbdev/sm712.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sm712.h b/drivers/video/fbdev/sm712.h
index c7ebf03..83fe25f 100644
--- a/drivers/video/fbdev/sm712.h
+++ b/drivers/video/fbdev/sm712.h
@@ -101,7 +101,7 @@ struct modeinit {
 #define mmio_addr		0x00800000
 #define seqw17()		smtc_seqw(0x17, 0x30)
 #define big_pixel_depth(p, d)	{if (p == 24) {p = 32; d = 32; } }
-#define big_swap(p)		((p & 0xff00ff00 >> 8) | (p & 0x00ff00ff << 8))
+#define big_swap(p)		(((p & 0xff00ff00) >> 8) | ((p & 0x00ff00ff) << 8))
 #else
 #define pal_rgb(r, g, b, val)	val
 #define big_addr		0
-- 
2.9.4


