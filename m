Return-Path: <linux-fbdev+bounces-574-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C137E82DE63
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jan 2024 18:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF9891C21EE9
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jan 2024 17:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DAA1804F;
	Mon, 15 Jan 2024 17:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ii4ZQbpN"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6FE17C7B
	for <linux-fbdev@vger.kernel.org>; Mon, 15 Jan 2024 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so6981035e9.1
        for <linux-fbdev@vger.kernel.org>; Mon, 15 Jan 2024 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705339289; x=1705944089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IjkFYZF4OJsSCux1ae0KuULOn1wykr+CXrlgMJayfq0=;
        b=ii4ZQbpNn+VpHZoDLjK3ZkDmdggSBxUJ+uid6MeMEI2OL9Of/yRkoklnBdiYtvNdwO
         6hvvn0zrrNshMmIglQW6EZOPwFxPZewGScw+yGEdzp6gw0QkE2MRrp+8CmiiLSsEdYPF
         ZXbfq6sSyp8xXrfIiTw1B0kzAaQ1at62qeoi5LGQ+YgVlfp5QvR4lufoljfKAf1OO1Jo
         tt+voRkrCFGdKXqjPazTnHU432acDA+JQMHlRGaHb4MiXURe4U7avEnaeitHQ3Y56p7i
         XsY64A+wTC2a3Nf3P/W6EXrKPL7Dq4/bgO8ZKjIDlVyDEZ8k9pHzOTd+yE9nQ8JQc6CT
         MPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705339289; x=1705944089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjkFYZF4OJsSCux1ae0KuULOn1wykr+CXrlgMJayfq0=;
        b=ekjfJ94rze62wMfE1qifrr6K+I54UTPuALqQShusq5xz9/NH/jCWTd+Aqnr+JhUTzH
         aOpsVUwK8jcDya7YpKvXHmuY+5Ixs+G1FFeUIDpaB04ZRdylO7QVgRx9Nxntou8p4uvu
         aJk8krdMJbKcqF0alntZ/Sjq7bR9TezJMn4klXLstu1yFuFOLdJjNBCKs+h5095pagaR
         D+Hi1JB3vG6Zyp7Aqyu+BJj+lVgQf8U8BEtc+y1emVwsWyC4zQbLLQct3SmFSpc2WExs
         juzvN45eYl4i4czf6wa1u5YkbIPMy5D5LEATNdoNlnU9py+WxZPZ4jNopltVQoxtLa6u
         58kw==
X-Gm-Message-State: AOJu0YwFVbdrLAK7lY34JOYPEWhhK19GPQAHynyfal+vx4I46UWGizpB
	shqJQqkpg4ee//aI9GEXwd5O+U9viUSAdQ==
X-Google-Smtp-Source: AGHT+IGEIWTLvbhgXwT8d2oD5iyG6zHn0v20sib1KcKMQWPEWI9LPUGG9Iy5hCJrKDalyprRbZDANg==
X-Received: by 2002:a05:600c:44f:b0:40d:3fee:97f6 with SMTP id s15-20020a05600c044f00b0040d3fee97f6mr3339548wmb.34.1705339288709;
        Mon, 15 Jan 2024 09:21:28 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id l6-20020a7bc346000000b0040d81ca11casm16167428wmj.28.2024.01.15.09.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 09:21:28 -0800 (PST)
Date: Mon, 15 Jan 2024 17:21:26 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Fix potential NULL pointer
 dereference
Message-ID: <20240115172126.GA31203@aspen.lan>
References: <20240114143921.550736-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240114143921.550736-1-andriy.shevchenko@linux.intel.com>

On Sun, Jan 14, 2024 at 04:39:21PM +0200, Andy Shevchenko wrote:
> The "im" pins are optional. Add missing check in the hx8357_probe().
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/642e1230-3358-4006-a17f-3f297897ae74@moroto.mountain
> Fixes: 7d84a63a39b7 ("backlight: hx8357: Convert to agnostic GPIO API")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

