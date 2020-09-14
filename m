Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA2126997C
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Sep 2020 01:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgINXJx (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 14 Sep 2020 19:09:53 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:65382 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbgINXJw (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 14 Sep 2020 19:09:52 -0400
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08EN9n1s059359;
        Tue, 15 Sep 2020 08:09:49 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp);
 Tue, 15 Sep 2020 08:09:49 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08EN9mQp059342
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 15 Sep 2020 08:09:49 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Subject: Re: KASAN: slab-out-of-bounds Read in fbcon_scrolldelta
To:     syzbot <syzbot+9381e25e04a6ea4f2a20@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com
References: <0000000000002e90d405af42bd38@google.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <6488cad8-cb86-90c2-c696-e498b7b5836e@I-love.SAKURA.ne.jp>
Date:   Tue, 15 Sep 2020 08:09:45 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0000000000002e90d405af42bd38@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

fbcon_scrolldelta() was removed by commit 50145474f6ef4a9c ("fbcon: remove soft scrollback code").

#syz fix: fbcon: remove soft scrollback code

