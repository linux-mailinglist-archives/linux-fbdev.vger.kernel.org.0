Return-Path: <linux-fbdev+bounces-2654-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E10924662
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2024 19:34:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2F741C23D3B
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jul 2024 17:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28531C68A7;
	Tue,  2 Jul 2024 17:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nZ4MPJY4"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CAC1BD00C
	for <linux-fbdev@vger.kernel.org>; Tue,  2 Jul 2024 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719941652; cv=none; b=o/tFbkWCgqU3zR4dNbDPry2KG1k+zQNXm+LoN8vEENFEchxPoVd5/E61s4iEknxLRU7W4r02mUpFL+1rKGwIfFzWU5F4YTYyTpd8eLV5ldngQ+Sm6OgA49r1g5cO22Tp0isLqD6blKse2Yb8QxvQoo8Vsxf3tboiiLBmUxDoy5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719941652; c=relaxed/simple;
	bh=/o5c+700JcEHhe5XAJMAq8Yr8uQLfpczFgZy6jDoudY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pj9eSTHLXDKqHwU01wOG6QRL+2fm3ATOz28iCQ0yRLLqRNEOxc54YzGCjHDfVy0Ry6gH0vRnwFy3v9CasiDW03QQsXmckg2hP6M3wxJoUbUK0LKjLi7Z2J94Joh1F7g7wEc0aQ8TUD7P65cjDc+DzEpIpgr0Dkc7l/9VhR5Jol0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nZ4MPJY4; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cd717ec07so5609010e87.0
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jul 2024 10:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719941647; x=1720546447; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cZz0RwSCh0QMB9gJx+0gDDvp+8YLO/0RV5ftBIqGid8=;
        b=nZ4MPJY4m1M7jtTDt4a6RZkxi0vTQfF6iWvItALB1D8Znh33p5wysQYorc0o9t6FMX
         HNWV3Bq4KK7GY0bDqEF+eAq9FpfyenFe4xRUR+UHq6AdMhiq5K1sDDfqUKNmC0hqMyPi
         arejn1NxL0TgRMrCwQUIhjnzILXqcV5DMhJypHE55JMK8ia+4YIlshKtBaxcbNoQq473
         Uz+x7FGqWvHZmatPkrZcYbPHXaqlx/wz1Xa/1GH4+x2oTBeXdOu6/WZjFxxCf/cRZkUW
         MEgnVHxotWjy55/p2X8vSxWeSccLmWnPa0hDP7nDyUWpojOc6IFK0SL7nt9HtY3d4DKo
         f6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719941647; x=1720546447;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZz0RwSCh0QMB9gJx+0gDDvp+8YLO/0RV5ftBIqGid8=;
        b=oYD9xhTUKpC3Cx/4gWuwVu7bv+1X6DyleX7S+IPhi77rZtJJ5bxPxaQoQpKo41kBV+
         M0Pgx9T096F9bVHcmPX42JZ1skqn+5sTVwhsb3TFte6PjuuoAvT6ZnavRLfBsZ+2jV2U
         ACjMLNtAp8/QYwileCRrgQbJq+SfkPxFE62MQjcI78xfOBFdcbWlIMgGE6vGg0NBTvo0
         O+PcCB0ZkWsJI/RUsgmscHH8kZElzfgBFq2Aw7Ov5Pz7SlyEA62pfuYFMGtdseM+/CQ1
         JNyti/6CSea5vMmymKBbmWo6EkpeAhgBvvBYPxehTc+haMnHfV3xxUk6IF1S511GzVBO
         UzRg==
X-Forwarded-Encrypted: i=1; AJvYcCUUBbAVJblqiruJNB6FOiby8TfQHjxlEeoZm98rbVqU8JOgVvjsNkvrC/7CxDxEXDoKsf7fAUGkTTnj7WGtTCzVefEBxRXm7mmZyvA=
X-Gm-Message-State: AOJu0YxYolU7oNS3nXJSHUrM9bwh6L+DPTVMRHnRvfX8n/g/aYeeC2qK
	LZTjxmi/VoVv9eoaMSg7wEqalEIam5/+VmSYswCoOnYgK107/5okrF1kDHe2qbo=
X-Google-Smtp-Source: AGHT+IFjYnN8Qw8rIORJHAmRqYrCZytTFvoTnvxnbl/X+PyzxSN0cPeaw+HT/4KTY7wnV29vzGq+Pg==
X-Received: by 2002:a05:6512:2245:b0:52c:8aa6:4e9c with SMTP id 2adb3069b0e04-52e82752786mr7398520e87.65.1719941646613;
        Tue, 02 Jul 2024 10:34:06 -0700 (PDT)
Received: from [127.0.1.1] (frhb82016ds.ikexpress.com. [185.246.87.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af59732sm207594485e9.11.2024.07.02.10.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 10:34:06 -0700 (PDT)
From: Guillaume Stols <gstols@baylibre.com>
Subject: [PATCH v3 0/8] iio: adc: ad7606: Improvements
Date: Tue, 02 Jul 2024 17:34:04 +0000
Message-Id: <20240702-cleanup-ad7606-v3-0-57fd02a4e2aa@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAw6hGYC/2XMQQ6CMBCF4auQrq3pjFCKK+9hXJR2kCYIpNVGQ
 ri7BTcGl/9L3jezQN5RYOdsZp6iC27oU5wOGTOt7u/EnU3NUGAucpDcdKT718i1LaWQHCQQkq0
 UqJql0+ipce8NvN5Sty48Bz9tfoR1/VIS1J6KwAVvQBW5LUxZVvZS66lztaejGR5s1SL+CPgvY
 BIqSQKbSmAh98KyLB/cjApe8QAAAA==
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Guillaume Stols <gstols@baylibre.com>, jstephan@baylibre.com, 
 dlechner@baylibre.com, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0

This series adds the following improvements over the current AD7606's
driver implementation:

- Fix wrong usage of gpio array
- Fix standby that was documented as ACTIVE_LOW but handled in the
  driver as if it was ACTIVE_HIGH
- Improve dt-bindings documentation
- Switch mutex lock to scoped guard

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
---
Changes in v3:
- Remove the two first patches that were already picked up.
- Add styling corrections.
- [Patch 6/8] Improve commit message.
- [Patch 8/8] Replace every scoped_guard by simple guard.
- Link to v2: https://lore.kernel.org/r/20240628-cleanup-ad7606-v2-0-96e02f90256d@baylibre.com

Changes in v2:
- Change scoped guard to guard(mutex)(&st->lock). This was tested with
  Rob's bot condition, and seems not to generate warning anymore.
- Reorder the commits for avoiding bisection issues and respect commit
  priority rules.
- Add vdrive-supply to required properties.
- Separate cosmetic changes from content ones in dt-binding
  descriptions.
- Move maxItems changes (and plural in descriptions) to the commit that
  adds conditions.
- Link to v1: https://lore.kernel.org/r/20240618-cleanup-ad7606-v1-0-f1854d5c779d@baylibre.com

---
Guillaume Stols (8):
      dt-bindings: iio: adc: adi,ad7606: normalize textwidth
      dt-bindings: iio: adc: adi,ad7606: improve descriptions
      dt-bindings: iio: adc: adi,ad7606: add supply properties
      dt-bindings: iio: adc: adi,ad7606: fix example
      dt-bindings: iio: adc: adi,ad7606: add conditions
      iio: adc: ad7606: fix oversampling gpio array
      iio: adc: ad7606: fix standby gpio state to match the documentation
      iio: adc: ad7606: switch mutexes to scoped_guard

 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    | 123 ++++++++++++++++-----
 drivers/iio/adc/ad7606.c                           |  47 ++++----
 drivers/iio/adc/ad7606_spi.c                       |   5 +-
 3 files changed, 115 insertions(+), 60 deletions(-)
---
base-commit: 340fa834ae229a952db04a57ed13fd5d35d75818
change-id: 20240416-cleanup-ad7606-161e2ed9818b

Best regards,
-- 
Guillaume Stols <gstols@baylibre.com>


