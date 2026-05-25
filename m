Return-Path: <linux-fbdev+bounces-7370-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCRNGUcRFGpeJQcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7370-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 25 May 2026 11:07:19 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8AB5C8578
	for <lists+linux-fbdev@lfdr.de>; Mon, 25 May 2026 11:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0AD1301ECCA
	for <lists+linux-fbdev@lfdr.de>; Mon, 25 May 2026 09:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FB03E557D;
	Mon, 25 May 2026 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="lWafVoJc"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [178.154.239.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A863E317D;
	Mon, 25 May 2026 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699727; cv=none; b=C7KwC+vB8hDtstVu9/4hIsuEg163S4o1oMMrGYGpIV4PhJ9DsZ3F/xcgGVvoMrZlRGGH/sIlOXTa7QqU0pecVAzhMSTTMuzrsh/ujrEt623sEaYzUDztzlQFCwXV1NeuWQB+Lhb1SZserKl6v5TuhdRQ6ee1NNxxqNWk0OTmqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699727; c=relaxed/simple;
	bh=MIj0J+AW53RCnzQ+5qg7U9y5+MAjictSABnZwTrdGBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8TnvrLH9BoE7s9eYGr0XgRkK7cyaiVtX3NeyOpe2lW2ARoIdCJer5Iod3w3TT3LVeVNmGTjHDGGo2Uilndd6vQjE7w6UHPHnOayCHmFNx8+QfjogptTT8IZg+YCvD/C6hz9/6dm8e8Qu/OkZj0Jzdi0OzzbWVH3EG2ORtdOj1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=lWafVoJc; arc=none smtp.client-ip=178.154.239.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1f87:0:640:a06a:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 21BB980E48;
	Mon, 25 May 2026 12:01:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net (smtp) with ESMTPSA id m1TmE1aggiE0-bYE3IN2z;
	Mon, 25 May 2026 12:01:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779699716;
	bh=ENSooiXn9MHBTXc9FR2h8yvwp1L27CN5h8YNsJcPXi0=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=lWafVoJcpHXztLyxuw4qQVNhGy1fA7uee7cKcibV/x/+eHzf2/Sln5zly4hS71hsJ
	 +2DexTvZM5pfefkZ1kwhhHXqU8wE9Yv6lvpZlC8z/Tu10vObeqiQRdeFw8wBeT6Of/
	 NZEMuRu2xZ2ElcIT8KdtNUEVA7qFIAZZAlI3wFfw=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.iva.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ahmet Sezgin Duran <ahmet@sezginduran.net>
Subject: [PATCH v3 2/4] staging: sm750fb: remove unnecessary initializations
Date: Mon, 25 May 2026 08:58:06 +0000
Message-ID: <20260525085808.171974-3-ahmet@sezginduran.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525085808.171974-1-ahmet@sezginduran.net>
References: <20260525085808.171974-1-ahmet@sezginduran.net>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-7370-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,sezginduran.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sezginduran.net];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ahmet@sezginduran.net,linux-fbdev@vger.kernel.org];
	DKIM_TRACE(0.00)[sezginduran.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: EA8AB5C8578
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove two instances of `ret = 0` initializations since the
variable is overridden unconditionally before being used.

Signed-off-by: Ahmet Sezgin Duran <ahmet@sezginduran.net>
---
v3: No changes.
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
2.54.0


