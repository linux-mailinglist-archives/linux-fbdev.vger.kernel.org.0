Return-Path: <linux-fbdev+bounces-6872-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFO3A3XP12mrTAgAu9opvQ
	(envelope-from <linux-fbdev+bounces-6872-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 09 Apr 2026 18:10:29 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 989043CD6F0
	for <lists+linux-fbdev@lfdr.de>; Thu, 09 Apr 2026 18:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46C363066469
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Apr 2026 15:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1818F3D5649;
	Thu,  9 Apr 2026 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKgKlz/o"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD35D318ED9
	for <linux-fbdev@vger.kernel.org>; Thu,  9 Apr 2026 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750330; cv=none; b=duaxuDcwLPbcbcp546mol3b5PQDxVRxB3VWZI2TNwgHIIjmw5PobTC/+QyXwuCXI3Cdv+5fl8wiPMtr+y2iX+DHPhgaNfpboQImfq9aLGgtxIjlctGEGbPYrgyjif0TEoGWaAgfm1+8G0D0Op2Oy9/qQjAReajTWL5TflwoTk7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750330; c=relaxed/simple;
	bh=+vHcx9lI7yya0W7s1XmjAsO9BEU7Hgjmcx7FM3fwsWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CPcj14WBR4oGrRAF3zLryqjRU7iZ+mub10pIJ4ud5ImJ8vXLOKSWkVKNaVEaDZ+KSfqbOEbCouEPG6aSuZ32Ad237SLqJO3d4E8bHfv7A2Po125/8xqsh9WpgbEiZB6tAP3c3XxhlRc4xibsjjn1DV2bg0fSwQTNh45knCBHbys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKgKlz/o; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b6b0500e06so1199140eec.1
        for <linux-fbdev@vger.kernel.org>; Thu, 09 Apr 2026 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775750328; x=1776355128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynn/Tv7vt536YLRzFScHBlkRRyfwxHMbDNUUOzExOGQ=;
        b=MKgKlz/oFasZ0Df7A7k5CJqR1qE3cHzJdyWwWgeXR1gO8X2uZ9edTJA5k3EEvzp+Vw
         r2/03u2QuRyVuoWvQ5oD/jRm8LDLzvpaLSAtFxTZG54DwD+W5RHYxF66qqD1MP3XNUpJ
         90PEMdcXSiFozn6y8L9zt9z2qh2iRONy+btk7GCzzLrqdofN0xB5zyJtwaJR5JNee8ZB
         O2gkftP4TllyM969p0GyWwMEReZuf+aD3tX0WyDtGfTPQl/9r1Hda64S3ahvCayAw1Dr
         PCfQC+T/vGtll3g1BdbWb6yiaeLlEzq9vVJpMZ9Xd2IqeiQR3tCrCCOStqGa5egEKMjK
         l+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750328; x=1776355128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynn/Tv7vt536YLRzFScHBlkRRyfwxHMbDNUUOzExOGQ=;
        b=j0a9gq+1R1uWeDZ2nLg+JcRCCWUSwP/RsVaaEuFgDv+wRAsfJrLZiMbJ0A/fiZxZVJ
         UgqKwS45d3P+en8R7WuX39XsXkF5QCSx0Gw7KAyxU9ibYavdjl4HyBBk4qUlSuFzpfYY
         6dYSAA9SSsRI+3xoPAyDPT1Sg8vRDkUryorNRFYNboATTobur9Aqm8JETMGKaK4vJaTr
         Qw5zsPb8TvqgQSvUw6Vkd7wZ3zX1y5Rb4k7DP8Xgug5wuHuEsXL1UFNzAHnPNV006THg
         bvqpTYWZlMc2/ilhoCGZ4OhXddxAn0Dy6dBdNI6BaBJC3HFGiGmirM625HbVCmOIY0DV
         Z+cg==
X-Gm-Message-State: AOJu0Yy8BFNeuwnCZZHBzbLEmw4IAR5G//XDqm3WrQ8Jfnp1CUrJE4Nu
	7RgkJgb306YkV8LCX5qTkU3TAaTJSfNot88I1LEOSVUl+hNSLrG8EyFR
X-Gm-Gg: AeBDietpYUQUZA8Y3L/6wOw3SnefYJMS7CooHKiyzTKNpb63F2J3A538qrBzSssvkmT
	MHQkhAnQ1ft1YbGuhwceOFgcHV4YflySr80GSRZGMW6EGpKCySCEI4YAb/ip6I0BCJaFBPTvAJM
	gbJjENHHy1q739pivxgEvRcqxtAB07onJsV7F0E71S0Qu1VeSpxjIPzWz90P4mtmfFCdkjL8SL5
	ygzb5URPZd++Ae2hlwEwoVZFczw4+oDHLlbzWhaMUa+/xYgB2GQDKJfZUJTetARyLJe8v7XnpP5
	UaGQbMXovjNjZBXXsvOFiC8W7sKJGA4qys72FvXTPUW2oO6wIkyKT1J9J6e+OyUlm2j/49OVnbC
	vI0gdWxiXetA1Pdf23eKHRtIZvOw0nb2xMlI8jpOMUA7pEXFt0G6Y4Nki758PopSoX53XA9mSeY
	Y40sq0WY4oE/LKgVHUX9/PLJSRsA+Twu8Fab19+jc+LIKzLdD+tjaP098=
X-Received: by 2002:a05:7300:1493:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-2cf28e8dcd7mr9670632eec.19.1775750327897;
        Thu, 09 Apr 2026 08:58:47 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d5621d5e43sm153746eec.21.2026.04.09.08.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:58:47 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 1/2] staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
Date: Thu,  9 Apr 2026 15:58:20 +0000
Message-Id: <20260409155821.23375-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409155821.23375-1-dennylin0707@gmail.com>
References: <20260409155821.23375-1-dennylin0707@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,siliconmotion.com,linuxfoundation.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6872-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 989043CD6F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The hw_sm750le_de_wait() and hw_sm750_de_wait() functions return -1
when a timeout occurs. Replace these with -ETIMEDOUT to use a proper
errno value and better describe the error condition.

All callers check the return value as non-zero, so this change does
not alter existing behavior.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..3809401baa3a 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -502,7 +502,7 @@ int hw_sm750le_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_de_wait(void)
@@ -520,7 +520,7 @@ int hw_sm750_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
-- 
2.34.1


