Return-Path: <linux-fbdev+bounces-1148-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C9285AFA1
	for <lists+linux-fbdev@lfdr.de>; Tue, 20 Feb 2024 00:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897191F224C2
	for <lists+linux-fbdev@lfdr.de>; Mon, 19 Feb 2024 23:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119BB56754;
	Mon, 19 Feb 2024 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="ewnDJnty"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EE736B18;
	Mon, 19 Feb 2024 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708384308; cv=none; b=czudIVZIDmnDse17QLdB5wlJJr4ieoUJo4kxTyXNdiB193hzovhUZoQk+5SwHojp/2flKnd9AAG5KHcCa2hII8wZmhbn4XfNg914DTWw9u42/mifjtCMaLplLQej+CSysjjxME/ibX3fqzTnu/ipuhmKimlSQ1ju4Gy5WdTz7GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708384308; c=relaxed/simple;
	bh=NeEj8AGKphheuB6alfncyh7fBudqA8Is+Zqjc3OT8Z0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kv/yB036KKqxvkGMVRFJaYabIlBgqawQPVvdnS1CelhYBclgWoyAxkGmvY6qp4NEg9PfHkVGWTt0uvPBJKI2LbT7wvoRFq8sjPGS/MdeGSFlCgZtVT8LHKkb1RZLm/Vkjwr58rvwLmHo3LUSKmJSlSHf9O6wiyIcg+s4uM1bzOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz; spf=pass smtp.mailfrom=z3ntu.xyz; dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b=ewnDJnty; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=z3ntu.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1708384299; bh=NeEj8AGKphheuB6alfncyh7fBudqA8Is+Zqjc3OT8Z0=;
	h=From:Subject:Date:To:Cc;
	b=ewnDJntySR99hk7Y+C2rNPaU8W2c51BkPkv55TF5pT2E6EdT1qp6HJQ1xPcRMkkyk
	 LmuXp92GmavpDBKO1VLay7QYD/GAZa2kCKSCO7ySm2ARtFg0BXngT9Pjre/TB6DiAN
	 j3qsRZ/ugJAecPUpmxdnU7viEmuQ3y4voKYdLRkk=
From: Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 0/4] Various fixes for the lm3630a backlight driver
Date: Tue, 20 Feb 2024 00:11:18 +0100
Message-Id: <20240220-lm3630a-fixups-v1-0-9ca62f7e4a33@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbg02UC/x2MQQqAIBAAvxJ7TjDN0L4SHcS2WigTpQjEvycdh
 2EmQ8JImGBsMkR8KNHlK3RtA263fkNGS2UQXPRcdIYdpxwkt2yl9w6JaWukMqisdgg1ChGr+Yf
 TXMoHaRKMAWAAAAA=
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "G.Shark Jeong" <gshark.jeong@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maximilian Weigand <mweigand@mweigand.net>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=NeEj8AGKphheuB6alfncyh7fBudqA8Is+Zqjc3OT8Z0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBl0+AeE/jVURL67849OakgmKw1qtHVwyn5sId8p
 QY853PAXy+JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZdPgHgAKCRBy2EO4nU3X
 VpP0EACNUE3CLBdgEIlA++Y7oQGLuk9N6C1625ObzLjLTNrYp81coe1VlkNJkkTDq5QdY0I04Oh
 UbZx6wB/KAUNTjxvhEhZhOevm/PYQMArePXT8X01GwEMFAdTznVRBMmIDUnuQ0jFt3to3QaX9HS
 RL4RS4fuin414ZQVULOSy1wtrjPpE//ujlUWOTWeedw9EBQW0BKOH5W71TQ3/PBI6WIVHYEB+g2
 zhjsUzpGLoQJfVky5XetACzWAx0juYnZhVliS6if/pVLnM9XqVcaFoy5/ezXb5WwJEpc2L7onI4
 LqTySNxBqtYAMhpP/x0huUbbRNMrGBhOgXw5BKtpU+qfD4QHTixaGrOZ1VN24cYQ4pMrVRqzdIA
 QRS5dJigf4rKKMYC83ZAXiIof6XTsCknwdMoNsujaTUcPcmPjNvNUkkjeGeq3K0Jj+nr1t6pXxt
 UHgfCoCp/8Kt+nIXz6Fsur0tU5aN92KK5xyyLgQJ18yrzoemR0eOm+WIlHOjGY9xNTM8ZQaHYNL
 5wfuZUF0W91ptmQaxnzjkxFLPKgASwaU8D9eM0ROAZs0/xfG1GdZJ/hqDUiw4sSdYYzfnU8maMh
 gNR1sgccozBpP8tDtAq2yJ+sOXhAtn06e2Xl9gLatMuC36JavLafUY8Q61+eJ/4vnFj1rFJoY/6
 e0t+URshdDX8GWw==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

On the MSM8974 Nexus 5 and OnePlus One phones (latter doesn't have
display upstream) the display backlight was turning off whenever you
would write a brightness to sysfs since a recent commit to the driver
(kernel v6.5).

  backlight: lm3630a: Turn off both led strings when display is blank 

Turns out, backlight_is_blank() thought the display was blanked because
the props variable is was checking was never actually initialized so it
was just reading some value that was left before.

The first commit in this series fixes this, and the others are some
cleanups / fixes I noticed while working on this.

As last commit, we can finally hook up the panel and backlight on the
Nexus 5 so blanking the screen actually turns off the backlight.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Luca Weiss (4):
      backlight: lm3630a: Initialize backlight_properties on init
      backlight: lm3630a: Don't set bl->props.brightness in get_brightness
      backlight: lm3630a: Use backlight_get_brightness helper in update_status
      ARM: dts: qcom: msm8974-hammerhead: Hook up backlight

 .../qcom/qcom-msm8974-lge-nexus5-hammerhead.dts    |  4 ++-
 drivers/video/backlight/lm3630a_bl.c               | 29 ++++++++++------------
 2 files changed, 16 insertions(+), 17 deletions(-)
---
base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
change-id: 20240219-lm3630a-fixups-8a9359e5a8ce

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


