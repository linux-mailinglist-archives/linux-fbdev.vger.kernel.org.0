Return-Path: <linux-fbdev+bounces-7214-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOHWLEJcA2qE5QEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7214-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 18:58:42 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F73252547F
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 18:58:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0002D30381CB
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 16:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D2E3D5C15;
	Tue, 12 May 2026 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="AjBSLLXA"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward203b.mail.yandex.net (forward203b.mail.yandex.net [178.154.239.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019093D45DE;
	Tue, 12 May 2026 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604844; cv=none; b=JmDWdREnOnfl+/YzYSf1r0jPwEJFnHkRZ9Zolfjyc0LbJuRC6PRUuRUtChB+cnjARvuPeUQfZTW2r2CoO2a8dG2Q2oDzDWeB4VYi0Y6FHAg8Wt8i6Yv2jsogRbHZC8g2TpU90OzNQJnodtDsiat647tT5zhQCNRrXnbUjyNOuSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604844; c=relaxed/simple;
	bh=lXWy77SnZsUNQL8OZuCYQBixu6UPF5N2uPbtAbDm81A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPC3WPiDoYlJSxuZylCiuqSxP1T0WsT/e7xSPdMt/Kyti5SF+NAE1v5pavmpVqTthc5MHGRBdCMJ/8CK7v30aBA4+WwVvkQsjqiY9Ktuo0v0/AWywsXCuLzXhgHq3xzQXdMDwH6PEYH7rKcBT96X3TCUktPg7R7YFsCI/Wq3GLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=AjBSLLXA; arc=none smtp.client-ip=178.154.239.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
	by forward203b.mail.yandex.net (Yandex) with ESMTPS id C143381408;
	Tue, 12 May 2026 19:47:59 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1f87:0:640:a06a:0])
	by forward102b.mail.yandex.net (Yandex) with ESMTPS id 59B8FC00C9;
	Tue, 12 May 2026 19:47:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (smtp) with ESMTPSA id nlNSSYsRFCg0-9xopn763;
	Tue, 12 May 2026 19:47:51 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1778604471;
	bh=0Gg+wbrLji/tRqRmZB74iRx8IBsbBs/XfOZegHLyiWg=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=AjBSLLXAw1Mvt8iGF7xaEQ+f5YMjJoEHO7vFaHU4HTLJoRVcaYI+ROu/U75g1FMLS
	 ZqdBK3MmjVMgybS8KZBX9xdIU16yHFXJihTDQPrMUL/lp5xvEQwEdHX4ZLBSX9N1sL
	 FsvM/ZXV/KPP1RdAQSurXKcz8IUsEY0Hfi5Qxms0=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 0/4] staging: sm750fb: various code cleanups
Date: Tue, 12 May 2026 16:41:20 +0000
Message-ID: <20260512164124.188210-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4F73252547F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sezginduran.net];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7214-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sezginduran.net:mid,sezginduran.net:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series performs several cleanups on the sm750fb staging driver to
improve code readability and remove redundancy.

The changes include:
- Removing unused header includes and blocks.
- Simplifying frequency validation logic using early returns to reduce
  nesting.
- Removing a redundant variable initialization.
- Fixing a minor stylistic issue (double space).

All changes were verified to have no functional impact on the driver.

Ahmet Sezgin Duran (4):
  staging: sm750fb: remove unused includes
  staging: sm750fb: use early returns in frequency checks
  staging: sm750fb: remove unnecessary initialization
  staging: sm750fb: remove double space in assignment

 drivers/staging/sm750fb/ddk750_chip.c  | 153 +++++++++++++------------
 drivers/staging/sm750fb/sm750.c        |  12 --
 drivers/staging/sm750fb/sm750_accel.c  |  16 +--
 drivers/staging/sm750fb/sm750_cursor.c |  15 ---
 drivers/staging/sm750fb/sm750_hw.c     |  17 ---
 5 files changed, 79 insertions(+), 134 deletions(-)

base-commit: 6abf0b2df0b1c2205a4c0591425e6461afa62edb
-- 
2.53.0


