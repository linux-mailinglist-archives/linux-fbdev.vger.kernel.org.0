Return-Path: <linux-fbdev+bounces-4814-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06615B2273C
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Aug 2025 14:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D80F15043D1
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Aug 2025 12:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1293239E67;
	Tue, 12 Aug 2025 12:44:30 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4522154B
	for <linux-fbdev@vger.kernel.org>; Tue, 12 Aug 2025 12:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002670; cv=none; b=obucN4UuG7dDmNAYPzGEH/m3nE3oXdC04benOukr1Y9nCUK7IE0J3CjzKutpPdZP5x3oM54LqH+aemb06MBcjkl7dqy+6s+wosoGAGwFidRjkjT9nbCPbW3GBaiFnj4+2eqKCEObdVeFsqjjXjfB/cnrnov4Mlp/jQUdVXq64Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002670; c=relaxed/simple;
	bh=TzD4jA+N3MMYaWwcOXPOC4OerO3RLPLSpKetpxZyxcE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YIJhNi4X+7VwKevrJxM4mrYeaD/r0d1oZcd2EYAuYq6kkmmcQ5/ftyug3EqbejJrlkfBHX1eo4fjTl50oknLAl159fMn6rLMpiyiwQ+2Jvan5Y4h31dn15NVSgokGGhzF0vWQ/Fpfeijen/Xgp37d7Kb/guRfnMaeBVEB1kndHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-88177d99827so528998739f.3
        for <linux-fbdev@vger.kernel.org>; Tue, 12 Aug 2025 05:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755002668; x=1755607468;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GzWE/J4uSXlwdpiI8hN+iUBERztCJ8dbBSTUHerrzk=;
        b=b8JBU/Th9mNt1GVIVf4fIALjrdHX+Z0nHwelNELyRsrX7KFRrRnp/25GiTkmk0YG8H
         o6qMLbrMoP6TxbiajuJG+AbI+8BrF0AIwOnW5/gimfXhUNM350ayVcyePnNrEXIwBHbk
         ZOnjoTeT8KtCr4h65QKSPlRUC3JYEX7lowQKAgsk3VBSE00wXYNRkdpgP6t/l+m153um
         LirkV4oMdlfdHBJ2h4jHe43cIs/gfIG0MADn4hrF1sBUJCMk+r+vV1EoVQg4PuoEqOMl
         +Qh8XYlLsVE7ftG/p+Zw5BZW8VkfEA/3bejBYRaQWQyyZ/Hsqy17auBwzw56DfazRKa8
         Pymw==
X-Forwarded-Encrypted: i=1; AJvYcCU85+fX9VFZoM8GyXPULvVtWmdFREFt/Wy0P08IXwk7Uryt5YD7oy/HOLRpnch2yrXKYyQkYQX8IIJ6Mg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+pTNJxS1dp5BwWe2n4t2HFst5RAQJQk1nbWsX5se+VFqQ+EK
	PXHF98PxkQpRW0/W6u70TXGKenGNRU25Fdj7kHZ/BZiO5aarE2gHjGxg/3ga7iZQuOq+2l+HPN6
	T9GMX67ACSpvaf/plnJXcST0tjIav8w7VZ0nYvFxwbSdXXha+K1ENQEblYrQ=
X-Google-Smtp-Source: AGHT+IHcuQUBjTWzacTU13h3gx2dMNdcdOtTLeBpIAgpk97l3NdHMVRzgA60bLKt6sGnEB+bm3wrN14gbeqVEeihXXtGGranIpt7
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3f94:b0:87c:1d65:3aeb with SMTP id
 ca18e2360f4ac-8841be437femr626500339f.2.1755002668323; Tue, 12 Aug 2025
 05:44:28 -0700 (PDT)
Date: Tue, 12 Aug 2025 05:44:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <689b372c.050a0220.7f033.0124.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Aug 2025)
From: syzbot <syzbot+list949e1e9e2a92a664de72@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 0 new issues were detected and 1 were fixed.
In total, 4 issues are still open and 27 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 225     Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
<2> 47      No    KASAN: vmalloc-out-of-bounds Write in fillrect
                  https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b
<3> 34      Yes   KASAN: global-out-of-bounds Read in bit_putcs (3)
                  https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

