Return-Path: <linux-fbdev+bounces-3688-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A162A2A3EC
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 10:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99F3E1671C5
	for <lists+linux-fbdev@lfdr.de>; Thu,  6 Feb 2025 09:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2ABC214818;
	Thu,  6 Feb 2025 09:15:21 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65D225A5F
	for <linux-fbdev@vger.kernel.org>; Thu,  6 Feb 2025 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833321; cv=none; b=XVRtL6iQ9xHRswEWEFV9bb3voeo4hsLggevJ+8pZxwToXmuLpX2Mpqd5fcuYEOTT68e+Ng5VXEFpa7xWxWXLSAMvUwH/VOS7U3S2jYxKwexb/y/tyce2f9B1tbKXM/HigGIIbCMpsdlvdebEKoa8VO7xm5c5xzAWs9VV7BDSn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833321; c=relaxed/simple;
	bh=5hFr9r0+xVw070raBzXtRqNzSe0omxbKrZ3Wlaemwj8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kvBDfMCFka1einorwQXqY4f+7iJ3+yJEGLG1Pwdj4poiEmbNoLUr92BF81QfwuhAnJ1oxLHp08ZJOksXJWrpMAdWPzIxHOf2txDvHra37MLTX6sESDHCcugM81ZwRlyMKlzoG57l0XVghd9QGz77aUaGWnGK6AMBwkvXcnLAlC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d05999a1a4so4571895ab.2
        for <linux-fbdev@vger.kernel.org>; Thu, 06 Feb 2025 01:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738833319; x=1739438119;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xYOBYj7aJAB6p76ECKhTSVve+8W7ayGSimHBE//XKLw=;
        b=Lclf1o5geaJSZVCSp9gxGMbJwLJYSipglaiIK4oC/OsoFHgmPVXINvVSPlApsTuVvr
         6Lzm2LVZSFl5foHDvrUmamcgE7B2nFd8pjOAA45RSH1UaIzK+u5TP8LCz92s5vRWoFjD
         aK5yrg1x9cAD8hIK71zOHAjlydXyL0uPz2SHUjSZV3V/7BDZlzgWUfe9WKPYa6v9P7MK
         C+aGFyH9R6rzQhgdg0drsUF4kXb+WBkCk/JMjwBTMwPkFtjxIjmO4Mk/vZ8v2FMfTMqj
         H9zgLcvBPxSAY57EZfg+9MZc6YEd1par2a5hXBKM5Xhtn36xiCfj1i+VLVeZFCNjJQrB
         TiGg==
X-Forwarded-Encrypted: i=1; AJvYcCVyz4Vy91orW6OeWjqtSbqJZH9KHOwDcj6MEONIUHmq9aK1yqdTjgdA4F9CM5rjAUtUxFGr6ESRdldP2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdCU4sfoCPGkX+anPJKfJpZ7CzsSJ+RjYvm4QElmzXpUE2sB8
	fd9E2oEQfAZ7hfnp61pBIj0EDJxwfY2aYArBxvvdZnA712eFxiNYbNG1hpTmfhmFDljLNwhq2kb
	5MXI4+oWc/J/z3YZa0mZXeRxn9u83bzqWASAtcuczrOh8QUaTyEMZRvo=
X-Google-Smtp-Source: AGHT+IEAqn2vw/fSFk8xV6QOIyrYA4RUnDiruBcJFhNgf8a+1jZtTCFOWtpHjqNyI8XXA1cwYd00rCgCnpFDGVPthTAimqgwbmqr
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d88:b0:3cf:bc71:94ef with SMTP id
 e9e14a558f8ab-3d04f901a64mr49860765ab.17.1738833319407; Thu, 06 Feb 2025
 01:15:19 -0800 (PST)
Date: Thu, 06 Feb 2025 01:15:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a47da7.050a0220.19061f.05fa.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Feb 2025)
From: syzbot <syzbot+list52071043e7dbf4b67ce6@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 1 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 25 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 527     Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (4)
                  https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
<2> 6       No    BUG: unable to handle kernel paging request in bitfill_aligned (4)
                  https://syzkaller.appspot.com/bug?extid=66bde8e1e4161d4b2cca
<3> 3       No    UBSAN: array-index-out-of-bounds in fbcon_info_from_console
                  https://syzkaller.appspot.com/bug?extid=a7d4444e7b6e743572f7

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

