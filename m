Return-Path: <linux-fbdev+bounces-6468-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEotMrryp2mtmwAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6468-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 09:52:10 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6131FCF1D
	for <lists+linux-fbdev@lfdr.de>; Wed, 04 Mar 2026 09:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A887319D28C
	for <lists+linux-fbdev@lfdr.de>; Wed,  4 Mar 2026 08:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACBC3822A9;
	Wed,  4 Mar 2026 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxQKvVuq"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698153932C8
	for <linux-fbdev@vger.kernel.org>; Wed,  4 Mar 2026 08:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613967; cv=none; b=XtSkhwfYoAXg0rV+/dn20/psDBH0ON8ZQXlhquuEm2ioeavJikpiNRAh+YbVKyCsLWFG72/Os+b464aaiz2XqSM5PcxdwAbZdQ7og1LuN7vuJWShcLNopqhNV8KfpdBTGfklxOSLLxwAmY62bNQ4/kLRWWiLLPiKnkJmuIcxxro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613967; c=relaxed/simple;
	bh=26HnA6jr8Gpj2ARL5WF/0FOSAJ8I03Q+Uhhb0MqsB6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QVmOZbyWulgo2jMaaw/8/5m/4Aq+l6wF1qwQZQaae5Qcmfw0bQ/GiwGibyUy7Ig4UDnJi8gTAiQzKIvz4joJQPI+ZgEhvW0zrRa7cm4UxzX8qH9Ta/HpSdiQNkVycMD2oCiWYs/KKq5DkwUv67ueEcjMSMFL6iWsiunfvVX9U7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxQKvVuq; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-35984626dbaso223339a91.2
        for <linux-fbdev@vger.kernel.org>; Wed, 04 Mar 2026 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613962; x=1773218762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q74EyZl/rBv7dMbdQMZD34TxKD7igp3TSZElWe8rZoE=;
        b=TxQKvVuqq7zSLV5s8Ttzu1il9h3jCVq9caKlWO7oBzahGucKSuBZmU+C+jVAOzftG/
         okPCRkOEgRg6+FK3gTLJfgO1SRH6GKWNt1KijXzjZDUk2MGEHpFP4Q64OTJhmqcW8V38
         ZlqJaOxdcpbqPsN5RKc5Cj38axWTAO6ZzGiT0J/Ln8mbXjgSrZcPb32jPa9Ast5qIugV
         qh3iPmJ8tS+bR7PfwKZHjWmqMbAVTb+kryde0lrQhE8LchXIkAKqExro8EYBRXlaZecx
         nWhYr8dtD0atlj68264OHP+2b4AoLHYqwU3RiQb8BC7CMz4h9kQWkJ3mkFL+hFGDHYXy
         K++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613962; x=1773218762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q74EyZl/rBv7dMbdQMZD34TxKD7igp3TSZElWe8rZoE=;
        b=ge1qxZ3EUOKw1vPojSw6fWmIluDcvMPnad+5tPwkYGkDZDy6sbPdoo/QLUTDj3M27u
         DOz6nU8HjR1p8gG7DJgB6mxAcPJ4EzuArgQX/RSMPXO4eRLqu+ZflDjRL7ZXz3PyfhNK
         fSLyhgdTc6QZiUIaPJQ515Rrr4OTykIgt52WXzdnISibI3qJ8JAJ3cF+uVKgDY8C5LSE
         lWZHcfj0Jcw1ZsoOnyg3pJu0neae0I5dxUYoyNQBSMadOAoRDO+BVXB1zy4pTZeQ7OJL
         IJ7BMAuMAIENz6/+Jm0pyIY5rmhhaGxVTOAtS+EH94kkq1hQvqKsH+n5A/ngDZhbm31x
         JkhA==
X-Forwarded-Encrypted: i=1; AJvYcCWQVOTZrs0+NfLxckDHT9q5xrpIW8Kah6B27cpp0iIBTTYyL8736zqCXKMM5qQ7jC0NrMWdBlDUVtSVXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFno5ryTK1gkqhv6jsucIkipeUMuGreqjrVrcxIScF3DuG8TYE
	G7VpZe9fdZvvZou4ji35Zd6RvPabtCNWPH//tCYihZ/r4of8mzjfMXB6uRvXwKL4ejY=
X-Gm-Gg: ATEYQzzhcPCwwB0dS7wObed4e4jgb8dCgnguri1iHjaERCUOdhIqfvCxXz2lZIMN9n7
	vY67clpWl0iBY0hyFiK7PKGrv4jyrlqgh6SpFoYkWJ6lpOHpGzc2drIWPhVBvtMTgPGAKnK3LRI
	AuYMIhY1/aG+qhxShA6A1gokuUrkFEVqgA6zE+Gr6GDoUv48plbcCU48m3iYHnT1miev1GGTDX/
	3UmORkHXFYvBsEvQVQHgMbYDFmrAjuLbBdUrdfojl/pGYxzG7mWRWlOoYbW0oSaq4DL4XpL/Onb
	+CBFagmmBxyB+7aj0nCKi7h8QLSu6TIIaDpTHbyBttImbLB5o0jgUn+1z4wC53eMEtE2TRisSsz
	ettt2pJ627jzRg3vNxQgBi+J4Z31x9IlpWdR3iC7pdjxYvCxjVpznzT47Fbn7CEhbEFX1xtEQXk
	/xniQCoR8orMXqhp3+Dn/kD5b6GBWnaZiD5qn3bbCdzLy27N5MeJGMBA9EmbD+4u+OAw+iUASsF
	FgrXrcZcvtUF7c=
X-Received: by 2002:a17:903:2f8c:b0:2ae:63b5:1785 with SMTP id d9443c01a7336-2ae6ab6c988mr9891635ad.8.1772613962439;
        Wed, 04 Mar 2026 00:46:02 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:46:02 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 2/6] staging: sm750fb: sm750_hw_fillrect: propagate de_wait() error
Date: Wed,  4 Mar 2026 14:15:41 +0530
Message-Id: <20260304084545.156170-3-officialsohamkute@gmail.com>
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
X-Rspamd-Queue-Id: 2C6131FCF1D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,lists.linux.dev,linaro.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6468-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Propagate the error from accel->de_wait() instead of returning -1.
The caller treats all non-zero return values as failure.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b24a..1bd0502db039 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -90,14 +90,12 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 		      u32 color, u32 rop)
 {
 	u32 de_ctrl;
+	int ret;
 
-	if (accel->de_wait() != 0) {
-		/*
-		 * int time wait and always busy,seems hardware
-		 * got something error
-		 */
+	ret = accel->de_wait();
+	if (ret) {
 		pr_debug("De engine always busy\n");
-		return -1;
+		return ret;
 	}
 
 	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, base); /* dpr40 */
-- 
2.34.1


