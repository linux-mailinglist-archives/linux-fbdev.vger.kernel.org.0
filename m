Return-Path: <linux-fbdev+bounces-7801-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LR7fHQOmRWrQDQsAu9opvQ
	(envelope-from <linux-fbdev+bounces-7801-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 02 Jul 2026 01:42:59 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA736F26B5
	for <lists+linux-fbdev@lfdr.de>; Thu, 02 Jul 2026 01:42:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=K0SeM34J;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7801-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7801-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7292B3033D02
	for <lists+linux-fbdev@lfdr.de>; Wed,  1 Jul 2026 23:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF103CC300;
	Wed,  1 Jul 2026 23:42:56 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC45239085
	for <linux-fbdev@vger.kernel.org>; Wed,  1 Jul 2026 23:42:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782949376; cv=none; b=kgaY0d/Drulbnw+nxNNlKdYNTOxqt2d/jTz0KOMYMgjQY1Xq8adTb47fGnxpe88RE5At3qnGFgUt4r0UdpZeSt1E1xIov+K3CMUX6cekKdy5eh5H48HjSBpIOe1VgaQqKrtpdvyzSjWzI7v5eUEgjPm0j4HtVuZk9JPTsoCUdjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782949376; c=relaxed/simple;
	bh=mNWeivU1LTCLtzAmnPXhb/l3Ii27zsURXKeeXn07BtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UZbPpQoHO5UjoeQlpaGxxyyiaa0owUjYSxC3LMjNmd5kOg5YR+VYTwv9il7x83jHnPIWPBehQ0QJhA6fOKcEYXrNz3LrFGkC55zDgtaMV43Bu/Xw/wM6WrgFLuXwQnB4e+qnzHAzuQHxPRYht0zEXMXZxT+yiwQW55vSkP/+n0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0SeM34J; arc=none smtp.client-ip=209.85.208.182
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39b22d0e488so11394441fa.3
        for <linux-fbdev@vger.kernel.org>; Wed, 01 Jul 2026 16:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782949373; x=1783554173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycdmV2nQEP91NkF/uwFJLP2QOp24ehuy24vYh15fuUM=;
        b=K0SeM34JksRPlffkf2lxVjGmjzNuykbSmF/WCYvg5wUY2HxSIHU1YEIcS2ajdZSKb8
         xDatJkOpsSr8QhQVuXEMTpSlC0bZ7XItYCKsFUaPFr9KVRXU6VS+vqxQcZ28QfbtopMy
         n9fbZZX/aefAv+oXQGcFiUENx2pqe6mTF+qQJ8EDDL0XdtFrQGpYyDMoGMGSY1cscOjA
         MzwwwRuP/6dElpoZb4GmFQ26RpT3eSnz2knkBKKTuV57FgT9sTvXdjIpdAACoIcPDlSB
         FfOrTF1/GbfLMusS2ZcSlKbwiVdq/SfHpN2ONZ0ylOS1/gTARwTPDLjQiPtUVbfX4VEJ
         0YTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782949373; x=1783554173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycdmV2nQEP91NkF/uwFJLP2QOp24ehuy24vYh15fuUM=;
        b=oZfTiXL6UBKxSc/6rwX8I1lUv3kllI28UnqCP5IdnyRvybNV6ZQq2ZWsD+gejR6dOH
         oeSkSmqlqlf75q52HiT8f/vetoecXCOoM5hVNyEJQ/Nypw885MxCB/L6sE+2vZqZXnfZ
         179okIuCofEEydLUpOfQmWbBR7wQXwzfErXmc9L5LlTXPJJ/UjlqZjpFVerEvIbRSod7
         Fs6D1MxDv06HRNzaRIp1+fQOCg+d/a8i/H1bCa60T3b5/qEuOTXerBUGPZtMCaj2cCws
         68ojbDMIQUFS+fE6lCbVmCiIcuHD7i5pbyziQaP67Vx0/6Yf1UWW7KgfUjIem0TcCSCw
         i1+g==
X-Gm-Message-State: AOJu0Yx4vUk4os8Cfo1m2tArPnUM9jf8KU5s01IaH6udFAttqN4A/Df7
	HHyRFYMPJODHlRsbXVBuOh0VVyyisSFcBExnyMnOMDdTl/EhwJGmtHw/
X-Gm-Gg: AfdE7cm1UN3KmNRBi7YcBY7ziK7gpTKK2HMO+2k5iVWTSS5wKOckIyQHeAlibH3/ixm
	R4ViAtnlZa5CeCLZdsIte9a/rb2SqLNAYN+ncjE1HeI9OcEv7hMEqAo89dd25EcgTAAk2kcgRZx
	3DGUYmiiq67ASbI6P94Ies8GcrjWUAyAqIYFFZ6awpTWIz2iFxmRyTP8ZKsN60ZVag0qY5XPPPK
	Kbv+YKSZSHXHzmB7r1UjNiQhlD6FQ7SqegKPzXnQuuDNX4Igqup8VIa7POWa55injcnl5ZpEjsY
	KWWWp81LSXC7KBgX4d1obK+dsJFDp9KYEW0qBQFgTPSsW3VPnwNlIQc1CeZggk0Vlg8tAGLJL7w
	hRsPGocRTHzau0YIfzkFyx9OR9xO7MxjIIJOoVkKFko2dBSamtKXmAluimDQy8jBPq/wNg4Mw8T
	oeafe+ydZIqb1EvSbJhLzdsn2ppoKL4zw=
X-Received: by 2002:a2e:9e08:0:b0:39a:e29b:9a2d with SMTP id 38308e7fff4ca-39b34102c99mr5958141fa.39.1782949372729;
        Wed, 01 Jul 2026 16:42:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2a:1c13::2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b37fda160sm2836261fa.29.2026.07.01.16.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 16:42:50 -0700 (PDT)
From: Melbin K Mathew <mlbnkm1@gmail.com>
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Melbin K Mathew <mlbnkm1@gmail.com>
Subject: [PATCH v3 0/3] fbdev: fix mode sysfs lifetime and bounds issues
Date: Thu,  2 Jul 2026 01:42:45 +0200
Message-Id: <20260701234248.236023-1-mlbnkm1@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260701231706.234715-1-mlbnkm1@gmail.com>
References: <20260701231706.234715-1-mlbnkm1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-7801-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:linux-fbdev@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:mlbnkm1@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mlbnkm1@gmail.com,linux-fbdev@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mlbnkm1@gmail.com,linux-fbdev@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9EA736F26B5

This v3 adds a patch to clear fb_info->mode before deleting a
videomode through FBIOPUT_VSCREENINFO with FB_ACTIVATE_INV_MODE.

Patch 1 bounds mode sysfs output so show_modes() cannot advance the
sysfs buffer offset past PAGE_SIZE.

Patch 2 clears fb_info->mode before fb_delete_videomode() when it
matches the mode being removed via the FBIOPUT_VSCREENINFO ioctl.

Patch 3 serializes mode sysfs access with lock_fb_info(), including
store_mode(), show_mode(), and show_modes().

Changes in v3:
- Add patch to clear fb_info->mode in fb_set_var() INV_MODE path.


Melbin K Mathew (3):
  fbdev: bound mode sysfs output to the sysfs buffer
  fbdev: clear fb_info->mode before deleting a videomode
  fbdev: serialize mode sysfs access with lock_fb_info()

 drivers/video/fbdev/core/fbmem.c   |  5 ++-
 drivers/video/fbdev/core/fbsysfs.c | 59 ++++++++++++++++++++++++------
 2 files changed, 51 insertions(+), 13 deletions(-)

-- 
2.39.5


