Return-Path: <linux-fbdev+bounces-7202-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIGCLyzFAmp7wQEAu9opvQ
	(envelope-from <linux-fbdev+bounces-7202-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 08:14:04 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F3E51AC73
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 08:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EBA51304CF8F
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 May 2026 06:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2568946AF2A;
	Tue, 12 May 2026 06:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="am6q5E4s"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A38C4C9561
	for <linux-fbdev@vger.kernel.org>; Tue, 12 May 2026 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566254; cv=none; b=k8PJbnGGsfc4ACijaxIzD4PlHKmQULMRPliNhotntGimSFhYgWCfrrz4HOnYd4DJMZpuXVuH1gNhMz8iW3/e2OGca9aLrmMqJbe5ixV/kLdxBAQcYr+TOmlZIREjR+gkOi0coaxuEpUhUTQNai6ATigAMFxGTD7LfPDtsstTPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566254; c=relaxed/simple;
	bh=VKAyXQlpHLqNcdXY9pwoEmItmyKJQQ2HVqeu7CYCxPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S6EETjf+wOtbCn0KdFIz1E9aTKdV//x9uzkxK/PyS7hONvCuZoUDGUc0KBOny55c6aLWhJ5Z5/AA/W5GpSherDLPrRIjl9eWd9+CXC2ya1SzuzgUXUxcvfH39Vj+k6oh01WXASl0XEXMvuqqwy1VkkKcXW3RzL//tSpvCXIzX1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=am6q5E4s; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3664df30f53so2295401a91.1
        for <linux-fbdev@vger.kernel.org>; Mon, 11 May 2026 23:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778566234; x=1779171034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zj5mcHoGCb5n/eSvfW+GLHRF1PYTpVVH8V9CqFbdRI=;
        b=am6q5E4s+rqZzV3VneU5Uk2NCmd8GrlGKpHfzRRtG3kv0YTjrcOBnQGm6NLlWpa1mv
         p8yoczcrApcEY6WjCBiH6h4EViXP4FI71qmb+mtrL+nw8ni5H+j9zIimXUvraRWQQiKp
         hVpM4ltrQRhByJf4B/s6NMx2kttB/pOI6SkkzLiOJODdqILbcBDmoxcOISAdUb344E8V
         lzhTJBNj5VGaCXXw/qdP50hfZ/Z3I4QU+EVReK5zdTF/jMUdAgHJb1lTzW9RG0TktQsN
         4B7Kbwbt9Ceo39E1KNO6dnHURZox4HkQf0JIiI1OmizTvDu7ZG8ucFNYN4iSDIQthiTo
         ZvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778566234; x=1779171034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zj5mcHoGCb5n/eSvfW+GLHRF1PYTpVVH8V9CqFbdRI=;
        b=gskZwUXD3Hy9hm7tBLaFyzJPKsJJd5NfJUgLm20sjGT04MISgtiA4mS91lL40wCrKf
         wW5ywnhBkHsjF8OBWKxdU8fgNA7nItQ9nmyd/Zm1XUDBe6weJq+MPTgoOUjHxgihAQa/
         bUz/NO/LRGFpeA18VFnFgtyxK3EubkAor21AH5uzoFNqWAI5whN8GjM8dESpUBGcM6I9
         M2Mqv0FTagOBQhEFNmrXKvPM+ObVdPVA1oHkjgu1AXB1dN1N/ugMY9KhprwIQxW24eTR
         rxyRDDpB4KV3MrYQ00XCrnhm6B0KR3F48xBYxnMKN2kKlgOvOKRYKosJwQp3SCm+vee6
         Onfw==
X-Gm-Message-State: AOJu0YyX/TPf3Nlkl8z3N7Ns05RphKx1PzXrap7qgt4b0kSeBnqYMeE3
	PxnO1+CEtEQ0pZOGB4bNBCQvGoLSiuQtZit9ct+7uE9HVroYS8tN1BMYaieLNeeSSFE=
X-Gm-Gg: Acq92OF2RySJzDM7iLKmSwBxLKwvYxQoZQCmfSKETM+6EK7sxAeXo49EfWWMWIV+w0S
	qR3Tib40/FmnSG99Lbz/0dlxPm/F2t29gz1jkgk47+nFuY9irhd50rsfQCjS/RjWXpulP1v3XPN
	gRvz6YR301jSSYJKB28i3i34toom/W95HDzM/ScTgqDZYu/MfAYTWRIGC5TuwE/ZGOTfFtZV4/D
	bpDUYF3wndbGrw/vDHaWGHQgxASgt69OUaDHxgl3CsB2jbMz1YGFOReQMmkYExby9SEmG4p8ra2
	zcVlPYUnV7THthL37+YkuZWulGbL7cUd9c0hi5Ygs4MSFwrORgSLVljDPu6USdnniBSxjaoZ+bc
	KBVSQLKLVgSF0ENKq4woRRjROSNhdBnXc7UIk2ZzdSzC/T31qQR4s1SmU3dchXbjbxWOfZfH2Dk
	ZzvE+OD7DAczQSLsVP7kva5yfKg9JXgPmuCmrA3LjPbj8PyAOmB6nKv35ZY8vVP2N0Au6ncsvwm
	uBG
X-Received: by 2002:a17:90b:33c2:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-368b17b7935mr1893015a91.0.1778566233926;
        Mon, 11 May 2026 23:10:33 -0700 (PDT)
Received: from localhost.localdomain ([2404:7c00:52:d485:aae2:91ff:fe57:5e15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d628474dsm9827915a91.8.2026.05.11.23.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:10:33 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH v2 1/2] staging: sm750fb: remove unused <asm/mtrr.h> include
Date: Tue, 12 May 2026 11:55:11 +0545
Message-ID: <20260512061012.76252-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A9F3E51AC73
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-7202-lists,linux-fbdev=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[yogeshdangal66@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.985];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

sm750_hw.c includes <asm/mtrr.h> under CONFIG_MTRR but calls no
mtrr_add() or mtrr_del() functions. The driver instead uses the
architecture-independent arch_phys_wc_add/arch_phys_wc_del in sm750.c.

Remove the dead include.

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index a2798d428663..f491d3aca468 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -13,10 +13,6 @@
 #include <linux/vmalloc.h>
 #include <linux/pagemap.h>
 #include <linux/console.h>
-#ifdef CONFIG_MTRR
-#include <asm/mtrr.h>
-#endif
-#include <linux/platform_device.h>
 #include <linux/sizes.h>
 
 #include "sm750.h"
-- 
2.54.0


