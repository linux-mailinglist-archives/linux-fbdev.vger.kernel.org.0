Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C577B26FA2E
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Sep 2020 12:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIRKOD (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Sep 2020 06:14:03 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:33079 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgIRKOC (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Sep 2020 06:14:02 -0400
X-Greylist: delayed 313 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 06:14:02 EDT
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MNbtD-1k98Bu3muZ-00P8yi; Fri, 18 Sep 2020 12:08:34 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, hch@lst.de,
        linux-kernel@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
Date:   Fri, 18 Sep 2020 12:08:10 +0200
Message-Id: <20200918100812.1447443-1-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HqcSX/i6GHoFmyY01bRB6CKtbn8MaB27UT0Ol1JC5D61FuBVEpu
 UPtbHHIjZAKhvhQIb6QZpWTk7Cvz8P5eKYlnmDMJqr7FJvy1X67irWQrLyhQzU6E69ytquW
 ZfAToXAayZQo4NyFOk8sxVZoPPCvYtC28GytZbVhFJdZO9GwqVdM8lxXViaenpLZT7/zWSE
 0tFo8ku0w0LaTGLKnXUzQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZTOfjxmbW44=:7xKPROFVHvDGjNtGzWHNQx
 Kbdhd3m8SRu/kjQBijH3F72mPu9pxQTIlrx5Tusa7N69Jx0ZHs182UKijT5vFYVuDzgw5v+WQ
 HbPASGmBY/j0z8BM4ciPPZnnMK0Qrk85SnLDf5qXQU+MetLn3c5yVTZkBOsFcFdUqkExWmL3Y
 bg8me4YzQOdZQ5tTv8D8xqt5CZpEziZSmX5e1A4HSox2VuU3BDtQH8e8FH2AIJBECl3mjduKc
 vp7TDycVBgSimqTnI1FP2UL6rZmcV2L1UTCW4XLthY+cQHLLjMkFbCNjUwjzILo+laUdwOFhL
 Wod8OE/e0jd5gPtiD3cTNExK9e2ijGL4MoCQvvcXb3xvdBiY2Bosew+Vli8xZzlplvXbWjaSl
 SAUFboJzjRLZbPoC7p8T+Fgaa+QPucYvbj9Pm9iWScdGGK0AUunh41h5CifpkdAWUdwEcN/MX
 InBOnURqDLGKYuNUnfXDSNQ+6sUoALYhpl0JwZdSogsKeDUVAuTpc/NCf4v+TQPR+olJnuVJ0
 4ARnPaf9y2X6OT9o9kHqaBErw+iw36Pcd0EEA0UGRv6bHPQzMGXQwLAE+gotRCEGQWS63k1i2
 hc9Ft/rEzRzOI2zW86sStSeV4JHdf60aPHHI4WiSThwRevzuMJn++TOquA1xrfTbxPZMPHkYI
 obBVkxvdNRqMl/kp9SYtIgWhVRyAa/nqbabq+glY3eFXmpRa5ASXZg5WgF2BtSzXW4dAXU9Gc
 ZCG2oOcPqs2lPv5d36WPZuwSDaeFa/bXcfvhf03y5/XZIuqAHw5rTkgwEVgLRrrOkSSFTu/wn
 tfIAw0ns7AqtvLo6TElduRyBobsRksY6P10troh/Ypw60mayUG84Fc1f5kEWhEfPclCqM0g
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

The fbdev code uses compat_alloc_user_space in a few of its
compat_ioctl handlers, which tends to be a bit more complicated
and error-prone than calling the underlying handlers directly,
so I would like to remove it completely.

This modifies two such functions in fbdev, and removes another
one that is completely unused.

    Arnd

Arnd Bergmann (3):
  fbdev: simplify fb_getput_cmap()
  fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
  fbdev: sbuslib: remove compat_alloc_user_space usage

 drivers/video/fbdev/core/fbmem.c |  44 +++++------
 drivers/video/fbdev/sbuslib.c    | 124 ++++++++++++++++++-------------
 2 files changed, 90 insertions(+), 78 deletions(-)

-- 
2.27.0

