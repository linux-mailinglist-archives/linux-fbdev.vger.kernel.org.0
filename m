Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7366CAA4
	for <lists+linux-fbdev@lfdr.de>; Thu, 18 Jul 2019 10:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbfGRIJO (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 18 Jul 2019 04:09:14 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37780 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726551AbfGRIJN (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 18 Jul 2019 04:09:13 -0400
Received: by mail-ed1-f66.google.com with SMTP id w13so29360780eds.4
        for <linux-fbdev@vger.kernel.org>; Thu, 18 Jul 2019 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Iyfr5/1NYNdQhpDWPT06wuP/cAAoXegst7lt2IsF58=;
        b=Z7bNK0nfFW0N6BAI/rd5EED657okw9jUljgqrouABquv5zutt1fVG9cnzovdPvciis
         KmFVJJy3QcvbNE2hG6hzs11SjCaCGvNXExkjBAoy7FPPfdiQgzM2w8/Q6zsSmyUaMgdt
         r+fACRtZtYBPe+sS/se1+IEvfwhP/fSaBENKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Iyfr5/1NYNdQhpDWPT06wuP/cAAoXegst7lt2IsF58=;
        b=LjdQ8S7fjLmJA49iCBO53ETalkEMhVofoQsgpM6P9e2ngr1FzAVtap6u3Aolp2kXh7
         C25OFCP7FF1cN5Gn3hA3WvrHgNLu7YtVpBFOd82O/arw/SqlqUAgNJGiLrsUv79FkbIr
         D33OnLYeiCr4ArsFph35PxC0T+u0SdOCrEQSiPzYuSnD3NbTmfxYol0yARiztwOB0XnR
         c8YTFo+r6UYAG12cXoOGigtHGri/hwFwBrnvOi+oymsbo5Jk8ZxQOt4QsBECFsM3UrAm
         4RaP6NOlvI4pIfaSex7+ZJzGxOGvi5RzIo29buXBHXNykOGl2VB92vLZoegzaQ7er+8U
         NXCA==
X-Gm-Message-State: APjAAAUq8T/vIXHfzm0OGyQHK8/LaQoYpWVjAkvqXcCR4ixOKnQSO9CR
        Hpl+1gZPzIDQvmkXX929CHAVa3bH
X-Google-Smtp-Source: APXvYqykBiX6Jo5Tfwh9csgIjcDSqs9NfSDZzAEw+X4to7YWwbULxI67P9uCx6KZm68g1spWwShXGQ==
X-Received: by 2002:a17:906:6582:: with SMTP id x2mr12620386ejn.2.1563437352239;
        Thu, 18 Jul 2019 01:09:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id l38sm7608440eda.1.2019.07.18.01.09.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Jul 2019 01:09:11 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jens Remus <jremus@linux.ibm.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-s390@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Pitre <nicolas.pitre@linaro.org>,
        Martin Hostettler <textshell@uchuujin.de>,
        Adam Borowski <kilobyte@angband.pl>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] vt: Grab console_lock around con_is_bound in show_bind
Date:   Thu, 18 Jul 2019 10:09:03 +0200
Message-Id: <20190718080903.22622-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Not really harmful not to, but also not harm in grabbing the lock. And
this shuts up a new WARNING I introduced in commit ddde3c18b700 ("vt:
More locking checks").

Reported-by: Jens Remus <jremus@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Martin Hostettler <textshell@uchuujin.de>
Cc: Adam Borowski <kilobyte@angband.pl>
Cc: Mikulas Patocka <mpatocka@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/tty/vt/vt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index ec92f36ab5c4..34aa39d1aed9 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -3771,7 +3771,11 @@ static ssize_t show_bind(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
 	struct con_driver *con = dev_get_drvdata(dev);
-	int bind = con_is_bound(con->con);
+	int bind;
+
+	console_lock();
+	bind = con_is_bound(con->con);
+	console_unlock();
 
 	return snprintf(buf, PAGE_SIZE, "%i\n", bind);
 }
-- 
2.20.1

