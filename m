Return-Path: <linux-fbdev+bounces-1331-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289A8717BE
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 09:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84DE31C20D93
	for <lists+linux-fbdev@lfdr.de>; Tue,  5 Mar 2024 08:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033258063B;
	Tue,  5 Mar 2024 08:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nIWujsfX"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2228C80034
	for <linux-fbdev@vger.kernel.org>; Tue,  5 Mar 2024 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709626344; cv=none; b=PUn0pObtJdndxIHgqVwFK6bAUUvjKOYkYgpYm6AVEBPQGGTopb8+bUFCvJg4zhq3smXDQhEkADv1t9b9pgUpAGGZV9kQzABzN6E1zuekuGle4ohYVx+B7OCMTBmdL8O3nrljVa7MXPprJN8rDVvfexkGQeJ6bPlaHewNMBZk7sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709626344; c=relaxed/simple;
	bh=zeZODmCY1S1uqMpI2blr7qYy9ZObZCI7jQk2MUKiyFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWll68/wwbMkQD+cE9q0OyAFTB8OMRXz8VvxxKBr+rqrPACui173oCmU98K5CjfEFnJ+fGau6qe2bcBoy1GEEZv6bnKNPV/VcwNLHumZmOxxwVDPqZ3RGygQPWnxZAasZCo1tdq1mjb4FW/i0el7LqgeOesyJLQpoyr3Z795nu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nIWujsfX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56759dc7ea6so2324715a12.1
        for <linux-fbdev@vger.kernel.org>; Tue, 05 Mar 2024 00:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709626341; x=1710231141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExK15caTzPYyfdwBopINcQ7SZOSz6etjc7XyN0ZMwpo=;
        b=nIWujsfXBoMvhjac9aKXXtnFOQBINMhT8PfnX0uMaNLk4qLp6lY6irBboTzhv7ysXE
         ZN4W+n3A/AGv//Rfvk8J5g0S4AJOkGhHorybOh/0XWj17T8BQYy7vnWTavT8/lOgk+lZ
         69RlHZRj+vaID6YGgy3Cx0eDeZd49MZz/hpO+bUCqdI2IoiNCXq+04YWsJKXv0bISOTN
         duEEoTwHloAk0cROyp10a7rOcL1NcfGjuIefYVfwU+yVXtW0TJqc+9XmtsIUStwhktyD
         c02Y1JGF37pPjSLJOdh8mtlKF29jDSMz8b3Tgl3KPuy0TkxHm9s+QITIL4aCV6Jh4Gg4
         haUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709626341; x=1710231141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExK15caTzPYyfdwBopINcQ7SZOSz6etjc7XyN0ZMwpo=;
        b=RERRkno8uX4QF0kYZQGV+WGdu0ootIYB2fTZSQsogtwMvYdywZzOFXrZBUtNa0EYsj
         ER4wZCQAEotx95O6KYVx6KxkeuZvdAtwzG+kwksbI0nQ/UZLBJjp/KjNMLOi9l5Hrcjv
         EnUjknn76PN4TfomhDgg9Njj7HEldvgnCl22aW2FFVBeSp+Ky9ZYHuqNpxynQyIhzhsH
         QcYzi5LM08KOqbF41x9aclXwC1HUPz4hraDtPu6rKl855aU83GIz9vxCRoAjya4tOUAO
         NYR2ti+KKrpUb4uIehh1+FgpDHV/RShPTdZXw30VSEoi5U7u/E+uBGHjJkSeweOvBncZ
         A3hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3fjBChJLiJV8TrvBUz6W4dRjJy4BePKFuKdc40uP2I3YW3AKji8RyedMIQyvRiWVm4zaDFM2mz+9NefEP6W9ad+uvn9zXRoexPtw=
X-Gm-Message-State: AOJu0YyxIjvgKZjGvFKznm//TTWMkwIBLKvQxLk+LK2MlgWRGG61fbro
	bxd12Eaqb7j1pE1xZf8mSV+iP39ObDX1f5U2R2A3GD7IQkdIIfzHS6xPaOG4pi0bnJAMVt3xbGo
	G
X-Google-Smtp-Source: AGHT+IH/uA8GkUvAAQ9ECD3IzSDFIVVQwU0E2DIbx0rKbCTdLIrwu2V+eRJ+cIeAiM/1pjiB98XZfA==
X-Received: by 2002:a05:6402:2315:b0:565:6c72:40a9 with SMTP id l21-20020a056402231500b005656c7240a9mr7989319eda.28.1709626340845;
        Tue, 05 Mar 2024 00:12:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 00:12:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 05 Mar 2024 09:12:00 +0100
Subject: [PATCH v2 5/7] backlight: lm3630a_bl: Handle deferred probe
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-backlight-probe-v2-5-609b0cf24bde@linaro.org>
References: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
In-Reply-To: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
To: Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zeZODmCY1S1uqMpI2blr7qYy9ZObZCI7jQk2MUKiyFQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPZD8MWfLYEt6rCWdnIjlfRQIRJw0u4/qqS+
 k5T0+JBGS+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT2QAKCRDBN2bmhouD
 12fvD/4o0bBt8fofIHD0XpWwJNvU3Os3cazAVsGlsrm4AuCVvGk4aJQUwr2TiCM3Tkz148/bo04
 ehgJuqLPlK6rYX4fV7mjoMH5d11p0rH7Ik63fMZSXY6zDeOGCXR3nQQXSJ8Y1boQ0sqOCTS7FcA
 4D+RC5tismY1qTv62ISrDmk2aVKW+UwAXM3Kt/rrxfN9sNQNh2XdZrdMN3QCwAsbyTAAM9k+Sah
 a7MNxdBbIVgGdUN2XZXri41Fy6WZXRCKDY34ISqggHrDp9u1q+JdB3Pvj68dwlBQthT7Cg7wEJP
 TA+vuZiV9M/TVJJT1sQXUs04vKn0BoVS9z6+h1tjhcNDWlJRFA63MIKJT2mw+v2UzcESTKY4scn
 ZHNt/lrucx4IoWVrEcqRxuEuvU5EDgG29iOl7BvCUattDGdpScEa5xxY7CCalBMIW26ip0r3jmf
 iyWE/FslUQjV5eWS4WgWzLeBFcKM7kMXojpndsq2Cl20ZQ9Zbb3wXMAKTlgAVroWrN845KAHvtK
 Ejq/Tcd680GH8y2/bWK/E9OQD2oP/K12UQltNNyvPVkO2NeQIaNAwRxOP3rBfGtlGhBrN1KYjp4
 ZsngSrMfZarGq8cQ6ZjWGWsgbSWrk+CecKiGZLj+kijL6abbj/XTfgUojaUpKnlbDanESNAGN3u
 obK5/meKgl1VgFg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Don't pollute dmesg on deferred probe and simplify the code with
dev_err_probe().

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/lm3630a_bl.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index a3412c936ca2..93fd6dbccc28 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -563,10 +563,9 @@ static int lm3630a_probe(struct i2c_client *client)
 	/* pwm */
 	if (pdata->pwm_ctrl != LM3630A_PWM_DISABLE) {
 		pchip->pwmd = devm_pwm_get(pchip->dev, "lm3630a-pwm");
-		if (IS_ERR(pchip->pwmd)) {
-			dev_err(&client->dev, "fail : get pwm device\n");
-			return PTR_ERR(pchip->pwmd);
-		}
+		if (IS_ERR(pchip->pwmd))
+			return dev_err_probe(&client->dev, PTR_ERR(pchip->pwmd),
+					     "fail : get pwm device\n");
 
 		pwm_init_state(pchip->pwmd, &pchip->pwmd_state);
 	}

-- 
2.34.1


