Return-Path: <linux-fbdev+bounces-1298-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C686FF43
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Mar 2024 11:41:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 263A12860A3
	for <lists+linux-fbdev@lfdr.de>; Mon,  4 Mar 2024 10:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0FA36B1A;
	Mon,  4 Mar 2024 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hS1YEJtX"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5174D36B15
	for <linux-fbdev@vger.kernel.org>; Mon,  4 Mar 2024 10:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709548897; cv=none; b=OQb2uAkFSB/yH6qS8Am3/q7egb6HAgYvZurEReISNInQ0kKlZGQtwpt6kfforBQyKBfMAz6z2NtkgkHh6szpWq7Bqftz365R7za8hWnyLPqWifJo92AZOJgncYbAVCng+kc8Q0hd2JzuCKHYuxhmDy2yp/2JvR3Lwt7dIlTJ7XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709548897; c=relaxed/simple;
	bh=vrHtVTxDzXnHnmBEAwyW6CZO5Ixx5yRmkfq/0NawaJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i84QSq1I/hRzF5fKufDlRWvjfcvqF9/A1/wr4GCG5h9qxkYx2r2jQU59iCuPgp50a5lgJyp47ZktRpCJdt4CqxhpUAIspgHQroCZuX6VpUyIyz/DL9nYueN0E5YPqxw2NA7ujne+CVpDiTFtE+34pp+zshyIdobWTjE8/HJQIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hS1YEJtX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d754746c3so2500500f8f.1
        for <linux-fbdev@vger.kernel.org>; Mon, 04 Mar 2024 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709548894; x=1710153694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrHtVTxDzXnHnmBEAwyW6CZO5Ixx5yRmkfq/0NawaJY=;
        b=hS1YEJtXkbSfbku4i3uWoA2qtl89Rxvt+RsH4dskoRdEMwZQm3EPzBzI0LhcN9RmFc
         JuLqqk6vlxCAFHoV35etoc9gLKuLwUu4yHep7Xh204JAIupVGolvrzleTvdf5t9XFqpo
         lNd4Za7tAo2Kn8oskBqRKTmHYn7EyiR3eG2XVTHlWrUWDU/xmI8eJ6nQWH6mOEDUnkI4
         cmI1gFI+JtHi6ON5ESjk/rYTf+0RKU4yqxn8MkQN+Gv3AfJGHMk9Nd2197xttCjJzamw
         M9NMUcIQVzVjsEPuGNQl+k+RGYAdN7Az36XcRJpH/1buEygkf2FPj4odFon5HZ5EOUWA
         kKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709548894; x=1710153694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrHtVTxDzXnHnmBEAwyW6CZO5Ixx5yRmkfq/0NawaJY=;
        b=jmMnw6DycymaYsiBJGE/Nvf0RphVdMXS0OPqCs1ZIRfgexHyzpZq5b+X7+kTPIhGUy
         OiIzLT3Laqq3rTFJ0l8sUOHAjGKUsTtyNOyDxaGUDK6M6B/UBHEOPGE+A4oV4mnFl3cn
         FkCEh4Qkvy9RmqZrMwTYJRW+M07QXfIFkvi4KwBG82Fl2XZjWOTUioZiqf8zoC2iCvmp
         L7kd/Wvb6B9cNk48wQ0TGndRxIoOWyoruLMMcwcGS9SSQm4pR4CCtceU07rKWc9GnEAa
         JJ7TgOrX74oi/SwL1ClUSSgmONmlCgoIyEKfzwKX81/Q+5vwr+KgrfX1ZlssZsLPwTRx
         DSBg==
X-Forwarded-Encrypted: i=1; AJvYcCXJvxm719gyLGRKda3skv4eX4IkiIliPeQ7ea3ZoqLF2tLOyMRA1KYl7ZXp946jficOln7/2qYwaN8Xgwe3i7Qgm+c7iMCV9e5hPuA=
X-Gm-Message-State: AOJu0YxQrBc3TWKNPcQiO5IWrPJMucM7Ffve0ByEQxFsPsD9Qkggi6ci
	tGEVxmiUE8qi3zb914/SKQln5YBGyL9tv5vi4NrxCE/B1nzUnEnlk4LyXqU4ZVo=
X-Google-Smtp-Source: AGHT+IHuTg+L0d+SsYB/hWx+WCbqqhs4YKUOH7u+m5Pfe3qeJQEf5b9S71I7FIfRX9NDNXPeyFgP4g==
X-Received: by 2002:a5d:6986:0:b0:33c:ec8f:7b51 with SMTP id g6-20020a5d6986000000b0033cec8f7b51mr6513642wru.16.1709548893708;
        Mon, 04 Mar 2024 02:41:33 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id bp16-20020a5d5a90000000b0033e0567e90bsm12266311wrb.5.2024.03.04.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 02:41:33 -0800 (PST)
Date: Mon, 4 Mar 2024 10:41:31 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] backlight: bd6107: Handle deferred probe
Message-ID: <20240304104131.GC102563@aspen.lan>
References: <20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org>
 <20240304-backlight-probe-v1-3-e5f57d0df6e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304-backlight-probe-v1-3-e5f57d0df6e6@linaro.org>

On Mon, Mar 04, 2024 at 11:11:40AM +0100, Krzysztof Kozlowski wrote:
> Don't pollute dmesg on deferred probe and simplify the code with
> dev_err_probe().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

