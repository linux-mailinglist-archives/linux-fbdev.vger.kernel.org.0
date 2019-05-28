Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB062C202
	for <lists+linux-fbdev@lfdr.de>; Tue, 28 May 2019 11:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfE1JDR (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 28 May 2019 05:03:17 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:47014 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfE1JDQ (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 28 May 2019 05:03:16 -0400
Received: by mail-ed1-f68.google.com with SMTP id f37so30561008edb.13
        for <linux-fbdev@vger.kernel.org>; Tue, 28 May 2019 02:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MkPaiys1FHkvX5Xasbg4uMlexzhS3Oo0c8bAmpggR9g=;
        b=chjJHMWFVuPfhW3A7wneTkspRz2zd+mGVI0vCAF6liTiOmsE5RMJw1G5cMrRnyNngC
         W2oQnkMN6UocrhEJ8dL6n810MNsuqxnBqMe8cuwYvDOWo8W60y/cNQRvGXu+RScDN24b
         yIAQaBhqHR1mwDhUGgUGALBnoax8FwNCAT8Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MkPaiys1FHkvX5Xasbg4uMlexzhS3Oo0c8bAmpggR9g=;
        b=nuXOn8u5aYgnw0kCR2ThitUktZaFQ5QJ+u3YWw/5ykiiPcKT+OKyJbWjURSLTxfsVd
         kt8ruBzWmMJJpx6H6l1eCjeG/IzzTQuraxiUtR8fTkOI+u2IczB2Yxi7mx3Yd28mOWRY
         p7YerumOnW8T+AeOGMCuFV2uBa6dIuSchbcjd+Lj34JDhi21iWjIdgJ3foxPfcnGXdjD
         dhTZs4p3uHRT41uvHo8algQSjTZlGHCsobxRYgcBgV90YepGzcnJC5YVQoXzAjDagTZk
         UUL0vklfhVGUtGsyEAYEDM3vtuxIn3V2/x9vbA/0Zm7JSHdDpra8P9FUk/F+BmQVIS/v
         8WgA==
X-Gm-Message-State: APjAAAWMR+ctjoIWwmCzBMrVCQ8rmiNMx4RS73eIZNAuBwTEPQPFQqZ0
        s8uFmdcr6l+Baz5v3MrHdXykqg==
X-Google-Smtp-Source: APXvYqxNUG3PIbLtvNeH5i4uB4mGfl/Vclh7rWNvv07X8NGzMdCrtTYqdpxbhNGmaVceS0uzEWD3gQ==
X-Received: by 2002:a50:b7bc:: with SMTP id h57mr111959297ede.77.1559034194600;
        Tue, 28 May 2019 02:03:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 02:03:13 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Nicolas Pitre <nicolas.pitre@linaro.org>,
        Adam Borowski <kilobyte@angband.pl>,
        Martin Hostettler <textshell@uchuujin.de>,
        Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH 03/33] vt: might_sleep() annotation for do_blank_screen
Date:   Tue, 28 May 2019 11:02:34 +0200
Message-Id: <20190528090304.9388-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

For symmetry reasons with do_unblank_screen, except without the
oops_in_progress special case.

Just a drive-by annotation while I'm trying to untangle the fbcon vs.
fbdev screen blank/unblank maze.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Adam Borowski <kilobyte@angband.pl>
Cc: Martin Hostettler <textshell@uchuujin.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Mikulas Patocka <mpatocka@redhat.com>
---
 drivers/tty/vt/vt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index fdd12f8c3deb..bc9813b14c58 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4159,6 +4159,8 @@ void do_blank_screen(int entering_gfx)
 	struct vc_data *vc = vc_cons[fg_console].d;
 	int i;
 
+	might_sleep();
+
 	WARN_CONSOLE_UNLOCKED();
 
 	if (console_blanked) {
-- 
2.20.1

