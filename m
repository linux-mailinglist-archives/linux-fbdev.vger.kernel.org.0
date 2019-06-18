Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C9E49AD6
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jun 2019 09:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbfFRHl5 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jun 2019 03:41:57 -0400
Received: from mail-wr1-f97.google.com ([209.85.221.97]:45943 "EHLO
        mail-wr1-f97.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfFRHl4 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jun 2019 03:41:56 -0400
Received: by mail-wr1-f97.google.com with SMTP id f9so12693478wre.12
        for <linux-fbdev@vger.kernel.org>; Tue, 18 Jun 2019 00:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=okoko.fi; s=okoko;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0PrSR+jN+SJngU5g9VL57RLfBmPfgfrprow1ZhWuEaU=;
        b=XbZMhCy9PwEALPH0NPGJdcZHF9zS0XOpOR8x3PSFQlEjCQ6Gz4bo2b0Z/DVboYMNYL
         bawh0DCI+ryYkeLPaXzxB8PkLFsPGYTd04hm54Pli6Hu9JocehoOAo5PJihEnCP9lOXk
         FkcVPkHXMltxhZ2+oh+mgoHbT57SZMkX/prR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0PrSR+jN+SJngU5g9VL57RLfBmPfgfrprow1ZhWuEaU=;
        b=jeuuiOvgXss1NJwmZ95Es+Le5aUGTbB4ppFClW67fDxjpb0wpItBQLCqf48iFBzRbT
         WMJizZwuH5vfz2hkGnmA0Ifdw2IVoScuATyONjxuuIV3RImQonXDqhZjP1n8sTi5kHeu
         I4zQkrzfv52thk5MZL8f1Wp/Kzkg3I2VvRutjuq3fOh7LpySspwf0ouaaoRKeMlDiPnq
         ew8NIXkuLISgv/RvIzofeuLDByRpXLgun6g+oWB3zWrTnHJbtvOvi72OrqV1yCELPqaa
         HCwgDCWPI2d2vLpO+pk9oQmzpxww5i8LvpLs9S8IGYhzuP3l15ds+9t7feESV6hL16+T
         oyCw==
X-Gm-Message-State: APjAAAUqqj2FtGQgz/V+ZI3uflfgck8HtWVVGSJZH0XL+F/sTOQUQYXh
        b9XK9cEbyZ8IocciwmV/pf9ECZ0P+w2WQvSMhacNs9tAkLxsmA==
X-Google-Smtp-Source: APXvYqzLg7eWFSh4aDeAY+p0mLGpxFDGnAoM7uLRTr9Z17I85OAZshKEtrRGTEUMuiUDdNcm1goZ80zuNSHH
X-Received: by 2002:a5d:5702:: with SMTP id a2mr37285683wrv.89.1560843714771;
        Tue, 18 Jun 2019 00:41:54 -0700 (PDT)
Received: from localhost.localdomain (46-163-209-30.blcnet.fi. [46.163.209.30])
        by smtp-relay.gmail.com with ESMTPS id l18sm212063wrn.66.2019.06.18.00.41.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 00:41:54 -0700 (PDT)
X-Relaying-Domain: okoko.fi
From:   Marko Kohtala <marko.kohtala@okoko.fi>
To:     linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
        Marko Kohtala <marko.kohtala@okoko.fi>
Subject: [PATCH 5/6] dt-bindings: display: ssd1307fb: Add initialization properties
Date:   Tue, 18 Jun 2019 10:41:10 +0300
Message-Id: <20190618074111.9309-6-marko.kohtala@okoko.fi>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190618074111.9309-1-marko.kohtala@okoko.fi>
References: <20190618074111.9309-1-marko.kohtala@okoko.fi>
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Document new bindings for adapting ssd1307fb driver to new displays.

Signed-off-by: Marko Kohtala <marko.kohtala@okoko.fi>
---
 .../devicetree/bindings/display/ssd1307fb.txt          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ssd1307fb.txt b/Documentation/devicetree/bindings/display/ssd1307fb.txt
index b67f8caa212c..27333b9551b3 100644
--- a/Documentation/devicetree/bindings/display/ssd1307fb.txt
+++ b/Documentation/devicetree/bindings/display/ssd1307fb.txt
@@ -27,6 +27,15 @@ Optional properties:
   - solomon,prechargep2: Length of precharge period (phase 2) in clock cycles.
                          This needs to be the higher, the higher the capacitance
                          of the OLED's pixels is
+  - solomon,dclk-div: Clock divisor 1 to 16
+  - solomon,dclk-frq: Clock frequency 0 to 15, higher value means higher
+                      frequency
+  - solomon,lookup-table: 8 bit value array of current drive pulse widths for
+                          BANK0, and colors A, B, and C. Each value in range
+                          of 31 to 63 for pulse widths of 32 to 64. Color D
+                          is always width 64.
+  - solomon,area-color-enable: Display uses color mode
+  - solomon,low-power. Display runs in low power mode
 
 [0]: Documentation/devicetree/bindings/pwm/pwm.txt
 
@@ -46,4 +55,5 @@ ssd1306: oled@3c {
         solomon,com-lrremap;
         solomon,com-invdir;
         solomon,com-offset = <32>;
+        solomon,lookup-table = /bits/ 8 <0x3f 0x3f 0x3f 0x3f>;
 };
-- 
2.17.1

