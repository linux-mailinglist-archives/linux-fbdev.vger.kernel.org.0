Return-Path: <linux-fbdev+bounces-7347-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i3f8HfY3EWrIiwYAu9opvQ
	(envelope-from <linux-fbdev+bounces-7347-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 07:15:34 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF4B5BD420
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 07:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377B63018080
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 05:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ED6312837;
	Sat, 23 May 2026 05:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="qOGVuEM8"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net [178.154.239.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842BD18CBE1;
	Sat, 23 May 2026 05:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779513330; cv=none; b=S8SLYDbTQfLueBV2pt/ekdUY4EilE3iUt/N/+J/IJ4a7rAtjAMVCF1963sz/Qx2A5JnqD1+NewupOzDIv4Cbm+hrKWVRUcaoSYxlcQ1zh8CZfDNlts29LqfkvEMoJQH+pYYx+u4DT4+hwm4pYdTtll3uvzNvV71mjBSqBYwaRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779513330; c=relaxed/simple;
	bh=wBsEslqHSzcZOToRuCJYBa0NsOBZBasqQoqO7lnNM38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igzc7V6WKPk6j5ZjtzGQnhplFPpwgARem/hiQAr/vYyuQ2Hh2BFBTahMNkJpmdy9zF9WFiqZ/cvvsavoOhoCyToyT9bkImgNfRmgKXNjNrks47gmM9QqscOIGOnb1oLRBDvQ5fKLPjZg8WsueEavc7zJw9zrADsAX7aapFkYOFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=qOGVuEM8; arc=none smtp.client-ip=178.154.239.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:27a5:0:640:93ca:0])
	by forward102d.mail.yandex.net (Yandex) with ESMTPS id ACA47C010F;
	Sat, 23 May 2026 08:15:17 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp) with ESMTPSA id DFNL0fJe2Ko0-0jAK5Ehr;
	Sat, 23 May 2026 08:15:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779513317;
	bh=9IQkRFrZzx9jy9bsZ4hM9kLrB/Ojkigk6X5R9R8hRIA=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=qOGVuEM8TkDAywLuupcEjnkL9hfrMNs9cHmyJf4XIN2PvW5l0s0C9rORXAbNCK5pR
	 zHKUi/OiOTRDZrOTorAwQkTBaIMY1Cm48h1Wtl+6ORbuwC8li1Ud/gsNr2z2wSm/Pw
	 ydkfFgGsjxfV8Qb10isd6Th03auMu0z+s+Iqi5bc=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH 0/5] staging: sm750fb: various code cleanups
Date: Sat, 23 May 2026 05:15:04 +0000
Message-ID: <20260523051509.166152-1-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sezginduran.net];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7347-lists,linux-fbdev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sezginduran.net:mid,sezginduran.net:dkim]
X-Rspamd-Queue-Id: ACF4B5BD420
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series performs several cleanups on the sm750fb staging driver
to improve code readability and remove redundancy.

The changes include:
- Removing a block of commented-out forward declarations.
- Removing redundant variable initializations.
- Removing unused struct fields.
- Replacing a hardcoded loop bound with ARRAY_SIZE().
- Deduplicating per-index fbinfo handling in suspend/resume using
  a loop.

No functional changes are intended.

Ahmet Sezgin Duran (5):
  staging: sm750fb: remove commented-out forward declarations
  staging: sm750fb: remove unnecessary initializations
  staging: sm750fb: remove unused struct fields
  staging: sm750fb: use ARRAY_SIZE macro in fb_find_mode loop
  staging: sm750fb: deduplicate fbinfo loop in suspend/resume

 drivers/staging/sm750fb/sm750.c | 47 ++++++++++-----------------------
 drivers/staging/sm750fb/sm750.h |  3 ---
 2 files changed, 14 insertions(+), 36 deletions(-)


base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
-- 
2.53.0


