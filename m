Return-Path: <linux-fbdev+bounces-6781-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM25GOwIzWm3ZgYAu9opvQ
	(envelope-from <linux-fbdev+bounces-6781-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 14:00:44 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20437A077
	for <lists+linux-fbdev@lfdr.de>; Wed, 01 Apr 2026 14:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9290730DD8A0
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Apr 2026 11:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE69E411601;
	Wed,  1 Apr 2026 11:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otB35D9V"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C092408232
	for <linux-fbdev@vger.kernel.org>; Wed,  1 Apr 2026 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044234; cv=none; b=dyesOaUeDUonDmyaiWbQOkoathQPVwOvW3NG/V3d5zic328tTDGzRh3ErWpk82T95JUCMmkQKKcgCL7lYFKFtuIOQN8JHrnXQP13XzqoHXGTXCcBSd8tZ2JIZJP5tH48NEERpa22kaoPjKf2Trs2Rhy3/HW2JtZYx3ajz2wyN/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044234; c=relaxed/simple;
	bh=eUhmrzdVT25OCdkUeNH4JVa+khkI4tspDIT/bFWYQkE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i2O9al2NUz6P8QeI54QbElVrjXfqwd61a90swE463R91ksN3OESuyq9xFgA9/vcl5sietg9rZzcdiz00v0k89VmvrNUme31WVO8wMBbIfTwvGgddYs9wHzxKJ3zX/wE+mvvIghzw9zUlG1E6MV5g7nQO/BeecsFo76ygoZa6tYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otB35D9V; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-128e4d0cc48so8107834c88.1
        for <linux-fbdev@vger.kernel.org>; Wed, 01 Apr 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775044232; x=1775649032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aT6V5P+e0JsAA4WNCPskshxPOVxvhnhHL31tSzgUe3w=;
        b=otB35D9Vmoah7NyoO96ctU7tp25nBAXgy7gqdVTtdvZKO14sWkPwHT3YHXSsCVuyHP
         tziGWFGGirc7lDNPmM5r/8jm9HlRaoH7dgy7wR61VgYasLJ4LKmCUDaB5oz6Bi0vw9rR
         8ipHn3XlGnYFd44JG7BtkxVWOmm96Rmp3vBXDHlfZwHA3BKIrUyIbThpp32vz3arfuOE
         beM8ANkdK0SA53fbHczDw/NdzzIV7m4fRqYexUaVsFTRHixfox+7NhbBLEmxuudx5ILY
         JOaioA12o3Uyu0S/6nOS0Snm/JZ5iYs5GPCv/o+jnVIXMs0BJFXZKa0CtrKq9GkmqSFc
         Lyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775044232; x=1775649032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT6V5P+e0JsAA4WNCPskshxPOVxvhnhHL31tSzgUe3w=;
        b=hC7VTA/zxdBQAWOuEHCfrePIJFsg9CX0Sncn9PJnFIUsDmpQ/0o4AE3jp/pMgIjYjV
         jUzk9wmlmDyTfrppN346x915sl5J060mHaYlkc0PJuup4FLTi7/C8wWJSDXHi7CR2IV5
         44rDS/ZCbEmz+K2kN3Ao2bsFvuSv2x281kZb+obInqA+XHlgOCJ+qHk3GdCtaKVgBZ2m
         g4d8iG5xoT12i9XSNH5Hc+3OhEABmc7gRvJihE+ZhmIe9y3cjDtWOPDK2YjDC8OGO97X
         /wRJqMt/vVLo+h8TU+lCpiVRfdF+pRMoBcLH31acONpHjmpAF3mZTKM3omuY6v5NBTrJ
         rDpw==
X-Gm-Message-State: AOJu0YytkoPstdKo8gNrAF3JfwHr3QFej0jrP9qma6McNcdpvLU27XUu
	i0vqWD6m6MXECN+ce1/0FdRrBjYmqnL0Ma++T5yG2rqKKZlaiy56+m7o
X-Gm-Gg: ATEYQzzibeYY94Ph4teWsAvNuoaAj2/z/6eISbh0WqcsGnmy9/APuwjlqcmJx3Wm4iU
	guql9rR9BgHNfJ+4T51wTft1OZF1DsERxRDvVbj93UfckRoSQynnBokjaXBr2iqdwiaAeqaaFKx
	0FQkswEJ4X5a95rHN7sFZa1+e7AdUmjzmmfixhO81tARYN3EQJg1xwFFzbrEwBozKI/LnOYm05i
	hyOesDh2epri+7381wagqKsYn3LDxQVD716napj3+06jhfSRLgwK3Gt7k12/5d5riWyQdw8NSmm
	7wj7++gIkXo/wpOMmC9F5X3xp1Auax/N3TWliLkZ9gkoz+QMEIiZoI4mzXr04pZaR/FpoXvEaW6
	NnSgIwtaFoaedOFt5RRTzxbd08sDfVuo/7EfcpemWDIb+b12XvZficVi3iv0wlNL9hfyKTX3GtH
	ynkODhbXhwXZlMQtvY2vd4fnIkKq/v+LG8jiWdfGmA+sTVaqxTBBGgW6g=
X-Received: by 2002:a05:701b:220f:b0:12b:ebc9:2464 with SMTP id a92af1059eb24-12bebc9260dmr174799c88.22.1775044232220;
        Wed, 01 Apr 2026 04:50:32 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab983f9f3sm19200148c88.10.2026.04.01.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:50:31 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v4] staging: sm750fb: constify fix_id array
Date: Wed,  1 Apr 2026 11:50:24 +0000
Message-Id: <20260401115024.89-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6781-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1F20437A077
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the missing 'const' qualifier to the static fix_id array to ensure
the pointer array itself is immutable.

Originally:
    static const char *fix_id[2];
The strings are constant, but the pointer array itself is writable.

With the change:
    static const char * const fix_id[2];
Both the strings and the pointer array are immutable, allowing the
compiler to treat the object as read-only.

Verified by inspecting the generated object file with 'nm':

    00000000000002b8 0000000000000010 r fix_id.3

The 'r' flag indicates the symbol is placed in a read-only section.

This does not change runtime behavior as fix_id is never modified.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>

---
Changes in v4:
- Clarify const semantics of fix_id.
- Add compiler output showing symbol is read-only.
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9a42a08c8..f7b5b22f1 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -728,7 +728,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		lynx750_ext, NULL, vesa_modes,
 	};
 	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1


