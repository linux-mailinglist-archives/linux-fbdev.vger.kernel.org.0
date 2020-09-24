Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3291276FFE
	for <lists+linux-fbdev@lfdr.de>; Thu, 24 Sep 2020 13:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgIXLc4 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 24 Sep 2020 07:32:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38646 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgIXLcz (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 24 Sep 2020 07:32:55 -0400
X-Greylist: delayed 442 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 07:32:55 EDT
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200924112531euoutp029e4675477936d0cbef71d704ad5aae42~3tJHtK1D03024630246euoutp02Q
        for <linux-fbdev@vger.kernel.org>; Thu, 24 Sep 2020 11:25:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200924112531euoutp029e4675477936d0cbef71d704ad5aae42~3tJHtK1D03024630246euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600946731;
        bh=Pn+KGQ/0eatnz1SDI+bsUyx5p9cGhrP+Kp+I3LL12qc=;
        h=To:Cc:From:Subject:Date:References:From;
        b=N1ysM0YwxHr33WxdxYUJa7XUv3PPL9DFzbRyE04TOsUw4L6sg9j2LqRwrVbWXiHNb
         djgRZJkQ/iXE0ZNI1TCIuIn3uOQpb/+wArqqpPOE216BC5crcW8sVWvwx6bQeZjM7j
         x93LumkPkNKlT0M9aVzYDE8mC4BdCtBJX+1JfcMI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200924112531eucas1p1668db225031030382029a38e83124885~3tJHh2Rwr1613116131eucas1p1K;
        Thu, 24 Sep 2020 11:25:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 74.38.06456.B228C6F5; Thu, 24
        Sep 2020 12:25:31 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200924112530eucas1p13af17d649767ed51c619d303392fa1e1~3tJHHbx-M0888208882eucas1p1S;
        Thu, 24 Sep 2020 11:25:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200924112530eusmtrp2b8e5323a5b9ebadd09bc8b1397ea3e2a~3tJHGzuAQ2695626956eusmtrp2P;
        Thu, 24 Sep 2020 11:25:30 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-96-5f6c822b74cc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 6E.07.06017.A228C6F5; Thu, 24
        Sep 2020 12:25:30 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200924112530eusmtip2670c2f340d655aa29e50cc87fde8787f~3tJGz2XsT0714307143eusmtip2b;
        Thu, 24 Sep 2020 11:25:30 +0000 (GMT)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] MAINTAINERS: mark FRAMEBUFFER LAYER as Orphan
Message-ID: <7b709254-9412-8473-250c-0c4e006259b3@samsung.com>
Date:   Thu, 24 Sep 2020 13:25:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djP87raTTnxBt+mcVhc+fqezeJE3wdW
        i8u75rBZPOp7y+7A4nFixm8Wj/vdx5k8Pm+SC2CO4rJJSc3JLEst0rdL4MrYvWcra8Ektop9
        3zczNTAuZO1i5OSQEDCRuHbzE1MXIxeHkMAKRolD19+yQjhfGCXOX7jDBFIlJPCZUeLz1FSY
        jgcf7zBDFC1nlDj8/ycbhPOWUeLu+nXsIFUiAkYSn19cAdvBLJAgcXrRPRYQm03ASmJi+yrG
        LkYODmEBO4n176RAwrxA5vsD38BaWQRUJaYsOskIYosKREh8enCYFaJGUOLkzCcsECPFJW49
        mc8EYctLbH87B+wgCYHvbBJ7nn6G+s1FYuWtT+wQtrDEq+NboGwZif875zNBNKxjlPjb8QKq
        ezujxPLJ/9ggqqwl7pz7xQZyKbOApsT6XfogpoSAo8T2Pj8Ik0/ixltBiBv4JCZtm84MEeaV
        6GgTgpihJrFh2QY2mK1dO1cyQ9geEmfvd7FNYFScheSzWUg+m4Xks1kIJyxgZFnFKJ5aWpyb
        nlpsmJdarlecmFtcmpeul5yfu4kRmE5O/zv+aQfj10tJhxgFOBiVeHgfNOTEC7EmlhVX5h5i
        lOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQozQHi5I4r/Gil7FCAumJJanZqakFqUUwWSYO
        TqkGRg7fCW576p0Vdwdt1337Kfb19F6ZF8wye4xbGF3nzVyd1335bs+xlp8TGDYdTDowKZRJ
        633TbPOpj9yn/eAIyGUJfpU4JfLk3ycPfCdy1xW0Bhg+N7z5w1O2/6KaQtfy2T//fJlXnl6m
        bqwjYSoxd8Oh6HvNd7cU/L0530EwfPL3iS9fixuo5iqxFGckGmoxFxUnAgBpALBdIwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42I5/e/4PV2tppx4g6lPNC2ufH3PZnGi7wOr
        xeVdc9gsHvW9ZXdg8Tgx4zeLx/3u40wenzfJBTBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZ
        mVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GXs3rOVtWASW8W+75uZGhgXsnYxcnJICJhIPPh4
        h7mLkYtDSGApo8Tm5vVsXYwcQAkZiePryyBqhCX+XOtig6h5zSjRuuUTO0hCRMBI4vOLK6wg
        9cwCCRLP5qWAhNkErCQmtq9iBAkLC9hJrH8nBRLmBTLfH/gG1skioCoxZdFJRhBbVCBC4vCO
        WYwQNYISJ2c+YQGxmQXUJf7Mu8QMYYtL3HoynwnClpfY/nYO8wRGgVlIWmYhaZmFpGUWkpYF
        jCyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAqNh27GfW3Ywdr0LPsQowMGoxMPLoZsdL8Sa
        WFZcmXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAD01klhJNzgdGal5JvKGpobmF
        paG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBsa50uZ5Dzk09n5gVelXuTe3UuyR
        9Iup77VeFCvv8b2dorGC43bfQ5MPriWB2awGvZcvnfkaX71m9xurALlXRqzZaoIpb76cs5O+
        dIbfiD/X3u+Qp9b6u3wR61/Iy93XkUmqkl5ox8sSwGQ8Z/eyV1E9z5TkzvNl2ZbzfNj2+F+z
        ztqLE/5O0VRiKc5INNRiLipOBAAoG/SYnAIAAA==
X-CMS-MailID: 20200924112530eucas1p13af17d649767ed51c619d303392fa1e1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200924112530eucas1p13af17d649767ed51c619d303392fa1e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200924112530eucas1p13af17d649767ed51c619d303392fa1e1
References: <CGME20200924112530eucas1p13af17d649767ed51c619d303392fa1e1@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

It has been a fun ride since 2017 but unfortunately I don't have
enough time to look after it properly anymore.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 MAINTAINERS |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Index: b/MAINTAINERS
===================================================================
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6894,10 +6894,9 @@ F:	drivers/net/wan/dlci.c
 F:	drivers/net/wan/sdla.c
 
 FRAMEBUFFER LAYER
-M:	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-fbdev@vger.kernel.org
-S:	Maintained
+S:	Orphan
 Q:	http://patchwork.kernel.org/project/linux-fbdev/list/
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/fb/
