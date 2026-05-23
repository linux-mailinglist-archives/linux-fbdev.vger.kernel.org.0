Return-Path: <linux-fbdev+bounces-7355-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHhuOTPJEWqEpwYAu9opvQ
	(envelope-from <linux-fbdev+bounces-7355-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 17:35:15 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 744785BFAB2
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 17:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D2C6D30058FF
	for <lists+linux-fbdev@lfdr.de>; Sat, 23 May 2026 15:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7803101CE;
	Sat, 23 May 2026 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="HSzscF/H"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D63282F1D;
	Sat, 23 May 2026 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779550511; cv=none; b=k+9TSRyRVhnBpfmiQcRIGHKkS8LmdgiOek2zACm8W8SQvdZuzq/sxuBVQUx0FfYZBVO43v1XWk/hJwuJvxupjhydjDoPe6SuAW9GlR4T1+o8Cvo/KxAWjy6IZoJ849nCAntzQxx4UhvDHyH+HT4AazX0LXH35o4XAsfa76JRK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779550511; c=relaxed/simple;
	bh=CwJNNCBsvJNFzSCWApDVhdbSadDMkPDrMPTtsIRi4i4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCZLHb7KQsU+hMv03KEGuH7HSPKRTMjGxSXbU+28SPQHry8/7GlSdlLNnUNkd8fMuJqiJL3F3/XGFlxD4uCZR5xDNN1EGdF3c4SK7odoc04gQrbDld88ubhrZBdv2PzGV2Tqk0CphU3Kq3JAFYNompeH1EY+X2Qo0A/zHDXREHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=HSzscF/H; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:eaca:0:640:4fc0:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id E39CCC0083;
	Sat, 23 May 2026 18:35:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net (smtp) with ESMTPSA id 1ZXKP9PgKKo0-sqI2a4YP;
	Sat, 23 May 2026 18:35:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779550507;
	bh=k4QiqVG9fkZCj6ihyj9tY2eiqlAdY8Oop4Qjl04unIk=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=HSzscF/HASa+8xgLFBz572RWIjS5b2dcfKnp6HIPqrENLFQ6yEsfAGbdjiAGNHXnV
	 sTXrx4HdizSE51j2v+Mh6Yu39UJVtq0eWv9ldj06+ks8NVaHa8Fa5U1aongllXfpg9
	 AAPGzjlXShEQ5w2PLrkY7x1mBtkdq4X+OUGOId9g=
Authentication-Results: mail-nwsmtp-smtp-production-main-99.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH v2 2/4] staging: sm750fb: remove unnecessary initializations
Date: Sat, 23 May 2026 15:34:57 +0000
Message-ID: <20260523153459.177488-3-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523153459.177488-1-ahmet@sezginduran.net>
References: <20260523153459.177488-1-ahmet@sezginduran.net>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sezginduran.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7355-lists,linux-fbdev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,sezginduran.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sezginduran.net];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-fbdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 744785BFAB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove two instances of `ret = 0` initializations since the
variable is overridden unconditionally before being used.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
v2: No changes.

 drivers/staging/sm750fb/sm750.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 02db1418476b..fff9c35ee7b0 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -343,7 +343,6 @@ static int lynxfb_ops_set_par(struct fb_info *info)
 	if (!info)
 		return -EINVAL;
 
-	ret = 0;
 	par = info->par;
 	crtc = &par->crtc;
 	output = &par->output;
@@ -463,7 +462,6 @@ static int lynxfb_ops_check_var(struct fb_var_screeninfo *var,
 	if (!var->pixclock)
 		return -EINVAL;
 
-	ret = 0;
 	par = info->par;
 	crtc = &par->crtc;
 
-- 
2.53.0


