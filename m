Return-Path: <linux-fbdev+bounces-4733-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D99B037CC
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Jul 2025 09:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E78FA1667FF
	for <lists+linux-fbdev@lfdr.de>; Mon, 14 Jul 2025 07:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1330A23183B;
	Mon, 14 Jul 2025 07:22:33 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169E3D76
	for <linux-fbdev@vger.kernel.org>; Mon, 14 Jul 2025 07:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752477753; cv=none; b=Uabx+TiJegybGSxQNCqPI07YjtZt+Mk6ZOptEYC4vVOJsOncIAfSIiF0KhjKb6ZAKQM+l4AKeghzVzIuSr/huNEckB3/kZ44OpOoFgWyoliqU8xrVsda7xgVCPqfrKzXyLLchmDE8i+wUCh6Rc7MkpREmgDKmaRBIV9qEBBhfPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752477753; c=relaxed/simple;
	bh=cUjRIPbmUy0lKKYkcdJFj/W6+blRgUvmQPyiuwbVx8A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hi2SF84x+X1qqElJ7xqLwCE2vJ4NFfhANBJKH8n3GwdJxI0nw9mjdb/xEODFCCkgeSwpZ8ZSsOxdODMhLg/M7JwYXdl5qTqz3b8ZegVuAW9raMdlwA8jvgf2uRpD24A8ysauM5QbLyXfyinqYx8pbVSO7aYJIpFyv3Rjbt88dH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-87632a0275dso350880839f.1
        for <linux-fbdev@vger.kernel.org>; Mon, 14 Jul 2025 00:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752477750; x=1753082550;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Po/A+wtbc1jdSXvCuFG0YJfDF9pUij39LY3Ij2dIkBI=;
        b=DBuYE+lovmfEH7oFZLwMrIbXyjUnob5I9PMGMg+AeL5XjfI3FhVfqC1TV694oothL/
         cZwz2SKZesSBH2eg5qoAU6j5OLaBliQf8bgoTYvYiJp10oFOIdD9MJttaDMYXmkTyysj
         weDGQbFY9JmLgK1y+iFvZODRtIH7WtFbQaHzPnYrqfaUR//ELa5lI++kLbqXMKME17Li
         JZ3y4a9iZHEPVzc1Vu/tDfQoqFXXlXxZj+1bXmusUlyCgYv1jxaVnQ3PjVzpJ2y+UVxQ
         SRXPa+em/g+PMAAPc9OtRpL8QPs5JFP8BGLgALVE9TKYdofGnYStBCRptuVFEBaN8wRs
         EUew==
X-Forwarded-Encrypted: i=1; AJvYcCVmXw42DNGZyMhLfQ2t5D+hy50eHpc7Ykp2e3p0p8iIKpMNlKZpzP5GNfdM6prtO/hvSxYBCeDpk9JsjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwvqtfmWf9oIkSxmmwjU6TMwHxeAzbU3/IIJlBxvlVLY0J11Jx
	ukvlx5Tk8w4xeBzcpDJwutynsaNnyaRb5p1MmZJkqj/msVWgrlvdb+vlt9r7ZS+WdleFB3NX34x
	C4VjoA4nV3FOKfMHshUJZMfboiD5DxYEutpoHU1A9xC/3pQONFGPZcm4qhlo=
X-Google-Smtp-Source: AGHT+IHow8fclkeQxrcpSvlhr8B47ljuvaAAHcrVgmrSeuvEPnUISMKfj5mI/kwyQvb1q1n87wIAn9yS2VssI6EbHb6hN6UsaG7H
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1354:b0:876:d18f:fb06 with SMTP id
 ca18e2360f4ac-87977ea916amr1283794839f.0.1752477750675; Mon, 14 Jul 2025
 00:22:30 -0700 (PDT)
Date: Mon, 14 Jul 2025 00:22:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6874b036.a70a0220.3b380f.004b.GAE@google.com>
Subject: [syzbot] Monthly fbdev report (Jul 2025)
From: syzbot <syzbot+listfb4485d95eabb4a677d4@syzkaller.appspotmail.com>
To: deller@gmx.de, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello fbdev maintainers/developers,

This is a 31-day syzbot report for the fbdev subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/fbdev

During the period, 0 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 26 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2587    Yes   KASAN: vmalloc-out-of-bounds Write in imageblit (4)
                  https://syzkaller.appspot.com/bug?extid=c4b7aa0513823e2ea880
<2> 192     Yes   KASAN: slab-out-of-bounds Read in fbcon_prepare_logo
                  https://syzkaller.appspot.com/bug?extid=0c815b25cdb3678e7083
<3> 39      No    KASAN: vmalloc-out-of-bounds Write in fillrect
                  https://syzkaller.appspot.com/bug?extid=7a63ce155648954e749b
<4> 28      Yes   KASAN: global-out-of-bounds Read in bit_putcs (3)
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

