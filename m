Return-Path: <linux-fbdev+bounces-1332-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD718717C0
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 09:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF041C20F89
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 08:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5775280C14;
	Tue,  5 Mar 2024 08:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pjgd7zpV"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A280BF4
	for <linux-fbdev@vger.kernel.org>; Tue,  5 Mar 2024 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626347; cv=none; b=J/kTmYEHqtJxJzgSA70/1XbGrBupuyQS1ZLG2IqpH96Na0V9J2caQ8+ghqC+xmjbVrRqQQAtjBtiuP4b92QjQE0E3Avb5n9U3GAJ3E886rW1jmNhvBI7bEpvipQS+R874nDCuXLawdx5L6jckKTeglTViLEQWJMuMhAOz8kI/9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626347; c=relaxed/simple;
	bh=inLsT1VkNNpcQ91Wz4F9uFHvSwYM79hrTLwE/rxQxRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I6ltk0y3X3A6NPsxkixpy/jM6EFSYFbDszW+NWYerH7oAZOm31mMhhs2JPsv0WGeV+rj6PiCpWx5AHuolvMpBsd39twixd7zwf6FLF04DF5zRZdD3qUZyWY1AzsHw6iM0Kc5PE68SLjmUsyMXl3DowyM2C/ToD4rDWNn3zbYaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pjgd7zpV; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56657bcd555so6663110a12.3
        for <linux-fbdev@vger.kernel.org>; Tue, 05 Mar 2024 00:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709626344; x=1710231144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIh814IMUk5rVefYqFVUgBnp3hq65uUsqUe2ecL/Y00=;
        b=Pjgd7zpVB7TIBolZQKc0cHSLkT2lzxIPb7KQHaxsyWYdtnWwIO9K8B3xALdqLklKma
         nPyejfGHU3UAEkHj3qdgaGWZTvtbggtnlj7mJbEtg9raZL1dIK1mHOMcnKf8g/yOtUiY
         N0icsDQ2pH+vv4HTWqiEp0BbWYPMFj/Rx54RBhfFrqvPelkiEw5YBk8C0P55X9NXq4dB
         6UgybzD1v3afraoegttkeDa1DGXhR3YcyT4puinWyhLfclNOJXcL7CMqu6HP/m9EHqJQ
         bsIS+ot/cDF650X8radAqRzbthixwfsGhCuDqQGfLDpiUpbk/nZ3gSq36AXLrNCD8ADq
         X80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709626344; x=1710231144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIh814IMUk5rVefYqFVUgBnp3hq65uUsqUe2ecL/Y00=;
        b=e14oyuSeMYLx+7WH/KP9i5V9AHAA0F/nC4nLbKuPhfKUvzuMviRphNvPHzB/TJ4lqU
         /4Dl0AYHK8fchOBSkPQade+usUIDIjyhZPUQpsvQz7g8doZJYY9PiZjM/CExlm7T2J7k
         kolIS9Ive42cEo/xFctzsyW/p3uE1Zqjcu4uk475XKgbqHUQIZSDRe9OcVAUH1NKcPIV
         Ugjs+6Ev65+905lqhC9Vem9zntrsHlOOg7BoftDOSrW12kCyi8IIC8VsuHCBQq1db7ZV
         szZV18ncXMLmD1YmraCq2EJwPjQKGGsWyh6uc07y8WO/VZcHeki9xNRh8eYAdVZfLwLH
         NeVw==
X-Forwarded-Encrypted: i=1; AJvYcCXiWwN1O3ceby2NgejBCTHDNkKOkvafXGJyub86cMCbrsGz2bvMhb424K1VzHz+1RnfEHB2at5wES6rdW3DbBWlirVxsS3ep0Y54Hc=
X-Gm-Message-State: AOJu0Yy96NcVM5nfGw/fHpoPR4gwWMDpr2dhr/xfD3SePJbc6qVN4INt
	crKGiK5rtxxRhrFyIJ0MA/WAIaw9EoELX4bEJpCbI2agqYKfH+qas1z7ntIj3c3zdYiXOPMx0p1
	v
X-Google-Smtp-Source: AGHT+IF1NY0Hm8ivs7aO2+SykkAen2RzTu+xu239XL5G/CqAmL0kvEQP4pA0JwC31R81oKLIggZO+g==
X-Received: by 2002:a50:8d8d:0:b0:565:665b:9c82 with SMTP id r13-20020a508d8d000000b00565665b9c82mr7135380edh.8.1709626343919;
        Tue, 05 Mar 2024 00:12:23 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 00:12:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:12:02 +0100
Subject: [PATCH v2 7/7] backlight: pandora_bl: Drop unneeded ENOMEM error
 message
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-7-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=inLsT1VkNNpcQ91Wz4F9uFHvSwYM79hrTLwE/rxQxRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPbyLAGnwidHT2FhDojPQp4jpY01sPQHqOsh
 1z/ozH7T0iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT2wAKCRDBN2bmhouD
 12mnD/47jc0NyWr3MU/W4BdsljAD/lH82VZh/9UG6ndVSQ118crkgBJGB86mt0+q+Grx5gxZCNN
 iarLv2GUAyMLnhsbsH0qm9lS0pkbkldTzyH0PDiOZTQ5NqvlHwhsOzSOlnBwx1aTV4jD6cZ3Wre
 X8lLUBtRlWqBZokl19oxqnNv33aKv5wby2A3pG6NnDT9pQAVhJSPTQKhIU8toq5pJFDZ26+ZR1h
 Ij3ea7Y2uuFPzhKfX/1F7/4RIHOr1arNpK5UrLfqVYz6U1KW8fSYp1dEXPHtNVAZa/WyNOIvuet
 qAs4Wbcs7dK9dUwJvYodbX1Mu1rL9eL31DP584V/kvHGD5Fa/QKXSNYZeni9QHR20ePfn51AGtF
 mwY+6TEK2OeD4bZONtbfdE+rFQczSLeHZrLJR5ikdjpz1jhc4qNtZHt9KykjnmP3ZU0gu+R+OFH
 aXfu+83AM9jkHbHtXg2tfKmJ2wneXwA/BRsK8pA8uGSYi8xWnWdf3+2vS3U8xYXeC6c3m4ssWeW
 PgZPuWc9qxZx4oVWeqBtW+8OS7Al0h591hqL5qhY5xaP7nPflBUbJX5nvmTOoXN/sJyxCvWDcT1
 eN9R+7hv/QsHEIHSXMoiJzEo08OjuN9VGUeyn3Gf5ljzobDGTG/m0r3R6/1HYdLlXkHEXxLgF4u
 u9l+0dt1vrXNYpw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core code already prints detailed information about failure of memory
allocation.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/pandora_bl.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/backlight/pandora_bl.c b/drivers/video/backlight/pandora_bl.c
index f946470ce9f6..51faa889e01f 100644
--- a/drivers/video/backlight/pandora_bl.c
+++ b/drivers/video/backlight/pandora_bl.c
@@ -114,10 +114,8 @@ static int pandora_backlight_probe(struct platform_device *pdev)
 	u8 r;
 
 	priv = devm_kmalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "failed to allocate driver private data\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	memset(&props, 0, sizeof(props));
 	props.max_brightness = MAX_USER_VALUE;

-- 
2.34.1


