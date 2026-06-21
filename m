Return-Path: <linux-fbdev+bounces-7665-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mq+yKaKQN2raOwcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7665-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jun 2026 09:20:02 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB896AA587
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jun 2026 09:20:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=MqXHeq+u;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7665-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7665-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 044FA3010DB5
	for <lists+linux-fbdev@lfdr.de>; Sun, 21 Jun 2026 07:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7E1235BE2;
	Sun, 21 Jun 2026 07:19:58 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCF41A3172;
	Sun, 21 Jun 2026 07:19:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782026397; cv=none; b=uDX75YhkRN6WjwdFEvU0qMhzkj+rxEtCFBpt0ApLUuH3tcQ+UoWBpchkl8bV+Yjj37Xie6BAKBLxnd+RJyMtbnJK9gwOZS/UIpzFlybSC/zKWwbkEHJ29JdqnMo0Rl4GP+jkfo+Dji/epI6He0hBoHXNrIc8TcAyFtdjfPbgxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782026397; c=relaxed/simple;
	bh=ddVyFPLXfSJPUnMhXaMsVgMtK0Xtot7Wsf25rO8Kjkw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q1DTOWdYYawfe0UUoo8kzpYVKPv+5/L0A0EzTN+FGQCgIgpZO2vWz2N5YDluHWNQIw8ZkSeeujb7/PoIISRi1C5EEnjbTm1FT8e6kbkDJhOXX1EtV6WHvEy4JKTGVLzJAD4mx5xU2y5VOwvH3U6fLqM1rappkeIa9wQ6aBZXCWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MqXHeq+u; arc=none smtp.client-ip=117.135.210.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Gy
	+BYmNC5qllOrfgUnbvNLvK/JBFSnaHhqOFp9Uj7Yg=; b=MqXHeq+uBcnpc5DNap
	rPV/sqxrQADrKTVpTZkvxPfAzFtHgdgjY24k0Xm9L6Bn4OZ+No6FgjA4pDkBYLFE
	CxOgJeEnZbbwolRF7p2ZxLoqIZaZSC9cJy46WRgSfC8kYz1+7/UGPZWI0GpapCgf
	rWxfNnPQR4fHtoAHRolGk40xs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgD3nyuIkDdqrW9VDQ--.30625S2;
	Sun, 21 Jun 2026 15:19:37 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] video: fbdev: pm2fb: unwind WC setup on probe failure
Date: Sun, 21 Jun 2026 15:19:35 +0800
Message-Id: <20260621071935.3802673-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgD3nyuIkDdqrW9VDQ--.30625S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr1DKFW5tr18Wr4DAr1UJrb_yoW3Zrc_Cw
	4UZF93Xr1jyrWrtFnYyFZxAr98tF9rXFyfWrnrtas3Cr9rJa4fur4kZF1fWFyUWr1DJFn8
	JrZFvF10vryfCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRKMa0DUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxQquHWo3kIrIowAA3Q
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:haoxiang_li2024@163.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER(0.00)[haoxiang_li2024@163.com,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-7665-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	FROM_NEQ_ENVFROM(0.00)[haoxiang_li2024@163.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6DB896AA587

Add arch_phys_wc_del() on error path to keep the
write-combining setup balanced when later probe
steps fail.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/video/fbdev/pm2fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index f34429829b7d..82408503c281 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1711,6 +1711,7 @@ static int pm2fb_probe(struct pci_dev *pdev, const struct pci_device_id *id)
  err_exit_both:
 	kfree(info->pixmap.addr);
  err_exit_pixmap:
+	arch_phys_wc_del(default_par->wc_cookie);
 	iounmap(info->screen_base);
 	release_mem_region(pm2fb_fix.smem_start, pm2fb_fix.smem_len);
  err_exit_mmio:
-- 
2.25.1


