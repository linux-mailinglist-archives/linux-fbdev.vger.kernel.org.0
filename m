Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93EED44C73
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2019 21:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbfFMTne (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 13 Jun 2019 15:43:34 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44899 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729086AbfFMTnd (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 13 Jun 2019 15:43:33 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so12440390pfe.11
        for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2019 12:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CYPkZ1kHlegoet40jMp9lNjbYY87zm41fO5/bnIRtVY=;
        b=FE4dJnLkWT/wzZIKxQnGm9hn3MWtcyqW/MT2wtn2Lwp9cOyu42ILOuYP/pEZisNPzJ
         arWgE8Ibze4Nb38GlZev9QW5KIPYAqK71cPwZGLO95/fclJ3exbgai9UrDk+z1owjH5m
         oEzN4hVjAhOfbGDr0fVqTnrlE/qoPBYiECaho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CYPkZ1kHlegoet40jMp9lNjbYY87zm41fO5/bnIRtVY=;
        b=ETWt5CgeXpHyKMirhdFKa7N7lghyPiys41g7HgeZklQdUxRhSVDvU10n2E5xYd7bU1
         9rl1Und5BSxsTfTY16XbTGF+xJtHeXO9z9+fWZPNJw3bqZvGkX4kMchUZ400DOnE7CCF
         YLwmmN2PODsCY5xLQDNzqOIC9JgqIle5bZxyA2pAOKMClnHRKe4D3A8GDogJkbDQ/IXp
         qs6TD/XFdQGv76bWEQaEdcZiPS79z1QgSVJR+xf5KHLVUWjDMJOINQvowUOqX7lZYsVA
         ajRtXQLRT/knn5g8CTZZNeBFCQk6wCazaSgtEsbcm70atfd/+2+vOb0lvYasLHuzbT6x
         pRKQ==
X-Gm-Message-State: APjAAAXxiTQX7r0hTgYxjxM/2NkC4W5kcPVwj6FdKQomAshnaXeDQdI9
        tnUmEI+PfOX+l/iFoWSH4g/KGQ==
X-Google-Smtp-Source: APXvYqycbVZXlvuqRzFiBln7zYVKC7ylbynb1qlibWK1KEuqMaOj0glQOfDd2xEXmxZcdeBGNd5Pvw==
X-Received: by 2002:a63:4c:: with SMTP id 73mr30610167pga.134.1560455012940;
        Thu, 13 Jun 2019 12:43:32 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id v23sm7853735pju.3.2019.06.13.12.43.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 12:43:32 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Douglas Anderson <dianders@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/4] MAINTAINERS: Add entry for stable backlight sysfs ABI documentation
Date:   Thu, 13 Jun 2019 12:43:23 -0700
Message-Id: <20190613194326.180889-2-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190613194326.180889-1-mka@chromium.org>
References: <20190613194326.180889-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Add an entry for the stable backlight sysfs ABI to the MAINTAINERS
file.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57f496cff999..d51e74340870 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2857,6 +2857,7 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 F:	Documentation/devicetree/bindings/leds/backlight
+F:	Documentation/ABI/stable/sysfs-class-backlight
 
 BATMAN ADVANCED
 M:	Marek Lindner <mareklindner@neomailbox.ch>
-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

