Return-Path: <linux-fbdev+bounces-7660-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PW2INGuINmrrAwcAu9opvQ
	(envelope-from <linux-fbdev+bounces-7660-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Jun 2026 14:32:43 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2CC6A8E63
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Jun 2026 14:32:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=appspotmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7660-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7660-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C7C4301C3C7
	for <lists+linux-fbdev@lfdr.de>; Sat, 20 Jun 2026 12:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D88391840;
	Sat, 20 Jun 2026 12:32:40 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3671615E97
	for <linux-fbdev@vger.kernel.org>; Sat, 20 Jun 2026 12:32:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781958760; cv=none; b=bwm1hHbSg1PNeDBzxZyOjuOC7nk7lpJVf7nrwR5Y3IfGkMfaQ05ZcJJ/PP2hqhhp/zKF3rbgsFy+QQMnEZbDqFbhVNNw5bVQG5I765S9IBzdCjZ7fxl5oF0c2hdSmMzx5vMyKs+o1tUOkhzMehNI/WDAxe2l/xH7VmLRwQ3SG7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781958760; c=relaxed/simple;
	bh=ACbZp9bZQnvW1VM7JiUbibRjlcUwrPplAGNOgQT+xwI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FpXusrwayOPDQdSMA5OKeEDsxrDFBfB+DzvMOK9ZJG1D1H2dvmZ9ABzdcvUkZRZCJReztGVYVbr3ZYe2jHv1yHhqFQs1uDfznK/S0jTjdeKP085v6L+hov8v3xPWxM4xKeKXwed5Ind7BuzDybB765pT6/UE4i4XeGsaaaP1+rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-48b60638021so545528b6e.1
        for <linux-fbdev@vger.kernel.org>; Sat, 20 Jun 2026 05:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781958758; x=1782563558;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bSDyNQhONyaGcj2p3z2sF0BPIBl1KdxlWijRwtEeTDk=;
        b=MIPZJNKQa/Nzb6rwSCEWZOcQqjwr30Dr6LRFPPq5qGTy11ko4b2t42mUzxe6tOMYxo
         CDOS+HOuMn4Y195iPMD4H1Of1IZ6w3ZGxDjNRruhL1oSq6HskOzJWXX5uK7XxhG9/x7m
         DW9KtzRqN9jES+dbD1RdxyZL3MTu/PkjAoWjWHHvhn8lZGUfYMce6we1Bzwwn75JZtal
         wYmaDtIe4Kp9Aq6fEsatM3fEdA1EUvUQ2a26ZgJTEUM93hXlrR0GiX9LJ8QH2yLVrAUq
         KTtajbEE254v9D37s+IR0ClrnlENAsxMxFUgOmmyRsw871RRt7by8XtTvzk/4BslwHBm
         7beA==
X-Forwarded-Encrypted: i=1; AFNElJ8gmBa+lVB6OwA7Z36fSNMGLsKWuiffbd9lYtlChZpJ/nIlESMdnp4VqLmcHna2/jdcySnDm0o2Wshn3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5w8CUZYz6N80Ds1Tq2i4F2Yl83FXGFzxCTXrLY5SmLQeAhT+Q
	fKqS6fw/uJnJisnCfNIjrGry/HQodr9DRrieRY9zPFOntp0g2QpAbQFufx+3tFvQKrlFpWKKqQF
	hzWE/Bx2j0AXtiTYJipb1jqQ7VhFNI8UnZXEBbDecVjMkO040Vp4LEgwttts=
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:181b:b0:467:15ad:9de5 with SMTP id
 5614622812f47-4896aa63456mr6366277b6e.13.1781958758313; Sat, 20 Jun 2026
 05:32:38 -0700 (PDT)
Date: Sat, 20 Jun 2026 05:32:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a368866.5c48295d.477b4.0019.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Jun 2026)
From: syzbot <syzbot+list4b2fb95ff146ecfb29b2@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:syzkaller-bugs@googlegroups.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmx.de,lists.freedesktop.org,vger.kernel.org,googlegroups.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7660-lists,linux-fbdev=lfdr.de,list4b2fb95ff146ecfb29b2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	REDIRECTOR_URL(0.00)[goo.gl];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,goo.gl:url,googlegroups.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A2CC6A8E63

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 1 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 29 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 5429    Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (6)
                  https://syzkaller.appspot.com/bug?extid=5a40432dfe8f86ee657a
<2> 1600    Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
<3> 271     No    KASAN: vmalloc-out-of-bounds Write in fillrect
                  https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

