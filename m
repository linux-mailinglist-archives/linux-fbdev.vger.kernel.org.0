Return-Path: <linux-fbdev+bounces-6536-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E1UHA9xr2m6YQIAu9opvQ
	(envelope-from <linux-fbdev+bounces-6536-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Mar 2026 02:17:03 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E284F243729
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Mar 2026 02:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FE003048EF1
	for <lists+linux-fbdev@lfdr.de>; Tue, 10 Mar 2026 01:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD39F2BE034;
	Tue, 10 Mar 2026 01:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="anzuCJid"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EBC269CE6;
	Tue, 10 Mar 2026 01:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105280; cv=none; b=NNdzfKclWeGZDQtvKec3IcrV/0T6CfxkJznlTGSZSh0TqMajW0Qoq9OUoakMvKK1MIiEf2k+zPtsrXxJJC6U9/k/ww2NGhAyztnBH0+H9SO+Sv01S+LsIEfIBr/6kC0W8rtT0Clh1woiW0azsI5dYtw8UJfjwJgQ93MLcpwEPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105280; c=relaxed/simple;
	bh=ikLWKLR9UX5av66TuqbzzvZKNipcLCat+JFN0c79Wfg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=V9Q6/L563CcsOqLMkrQU8rZDePMuAvlGyzXZTWTWpX2BV/vqinC4+aKhaqB3B3ldyyO2RG+VLOg9uWj1sIdlebGPGJXEvI2Qp/s1fDROCDufk1aTUW8ElcWZaMnSOsqgL0Q2SW+LimmXMha+PeLLS86FtxVWPdhXbDqcK69JoP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=anzuCJid; arc=none smtp.client-ip=43.163.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773105267; bh=fKN1B1R1uGOi7aCqLWWpClnJb3rwC+frVI631Jx0TJc=;
	h=From:To:Cc:Subject:Date;
	b=anzuCJid6yDMmyFsOKTuVozL6DimfPA9GnwVTGWDTY+G+DOI+X/CjLaM7vpn8VPUZ
	 3U2OL660sETDZ2KmVwCgf12dAuur1hIBVmV4hS3kSpLtz1JXwIHgaKdsSI87oPC8jy
	 qPcNYCGFvTDPHqnXOOvaSItfVKGse1ZJIt19ticE=
Received: from June.localdomain ([123.121.145.35])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 3983A430; Tue, 10 Mar 2026 09:14:24 +0800
X-QQ-mid: xmsmtpt1773105264t57xncli5
Message-ID: <tencent_5706A404B952870FEAC83A04EEFC8348A305@qq.com>
X-QQ-XMAILINFO: OOyEews/EdUgX9pLo+jdYMbZkVK9uYEzTviH8Ko+bNNQ+MB8HFe4XY5qCSRAIM
	 x8byOBC326ooghxICe+EEUk53Dui3B6oQJ3/ffLPWfglQ6leLBzHFmN0+vuqXZyxPe4nXg0ZuP2S
	 bO22nYdBgCHCkX3oB0/wYf/3C69fa/1E6ugW91Cdx0otogiW7UvSZQyFI8gsMyToVVHEGWqGz7Lo
	 79osq9nPFoeC8Mauib+kwEQxEZRIPX7TljqWcNFFNKqWmxtXLDfoXP2wz904l1RsosrYOcsuE/Xa
	 s95Nqkn5f9HvXFYXAXNtaxgvc+KuEEkIVaOL4ytLsLDVHDHb4VdROc2WVyLn25b8Jt0jUxLyP9hy
	 RP5RUKhwegfHqJQxmFM4ogqHoWGD6dE7vl3JLv9SxvSI+3KIQzrCtAFgkDZYNYDNPKQkoNx8ChIF
	 Crz9KIee26pYXlsOQRUl7UByegoXac9bCxwaFex0BqMpQPSfd0NiOnO2LCpyx9HrPixVQJJ3gJnl
	 FTNzOBQsCiOt+YEqlkueuiMT/Mf//g9Pub7j4h0jrQgCJIjByIjoOvn5CFwVd0Z8cwsIPOjiIeSp
	 P68iFDijxB/INICb89Kz3d55J8HabKOP1v/KUjreUnxmun2trDVuJdYPaDVMolfqGcx6yjGQ2yNM
	 zj5ynMEIVSZ48WXF69Gi/6qJjqyRwOfHggh9KK7JMM84q+LghMcXhdeKKJ/GKEe8cEEiSR1fHKfL
	 NjzJiY2/HrIehHGpIP1CkdmYK3YelLkNg5RN72YlfD/WaDfnEYJr2v6VdpA1KRXjBTQShEPVizpe
	 QywQBYjNk5jfLjrKd24mP5CAwWT9TFEuny54GW1DSnxpIivmLRZii83k+5uOf9nddxZZ0QFLZxAx
	 0RlZbQKXw1O2YEv/pdAFYb7HH3UsbNB3Ta4PwipsALA/xr/j7ca2b//RtpMl4uijMv6voySqrC6X
	 hJx9gah7krHYP4APJINYv6JumOuiNkmLk4iBLIQsjKf3hJuhkSluKEmH8yE+COIhb9ST/a16vf7u
	 pVxIyS0/G+7r3WdSq9pGLC24rNj+I=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Wang Jun <1742789905@qq.com>
To: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
	Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wang Jun <1742789905@qq.com>
Subject: [PATCH] video/fbdev/via: check ioremap return value in viafb_lcd_get_mobile_state
Date: Tue, 10 Mar 2026 09:14:20 +0800
X-OQ-MSGID: <20260310011420.8844-1-1742789905@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E284F243729
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6536-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,bjtu.edu.cn,qq.com];
	FREEMAIL_TO(0.00)[gmx.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[1742789905@qq.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[qq.com];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Action: no action

The function viafb_lcd_get_mobile_state() calls ioremap() without
checking the return value. If ioremap() fails (returns NULL), the
subsequent readw() will cause a NULL pointer dereference.

This patch adds a proper NULL check after ioremap() and returns
-ENOMEM in case of failure.

Signed-off-by: Wang Jun <1742789905@qq.com>
---
 drivers/video/fbdev/via/lcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/via/lcd.c b/drivers/video/fbdev/via/lcd.c
index 8673fced8749..91359d2b64fb 100644
--- a/drivers/video/fbdev/via/lcd.c
+++ b/drivers/video/fbdev/via/lcd.c
@@ -954,6 +954,10 @@ bool viafb_lcd_get_mobile_state(bool *mobile)
 	u16 start_pattern;
 
 	biosptr = ioremap(romaddr, 0x10000);
+	if (!biosptr) {
+		DEBUG_MSG(KERN_ERR " Failed to remap BIOS memory\n");
+		return false;
+	}
 	start_pattern = readw(biosptr);
 
 	/* Compare pattern */
-- 
2.43.0


