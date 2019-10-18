Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F368CDBE83
	for <lists+linux-fbdev@lfdr.de>; Fri, 18 Oct 2019 09:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389490AbfJRHik (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 18 Oct 2019 03:38:40 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33204 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfJRHik (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 18 Oct 2019 03:38:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so5093127wrs.0
        for <linux-fbdev@vger.kernel.org>; Fri, 18 Oct 2019 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dSeQpsX1lWyhJjjqgCnSOVYN/QoRMRw+pYlbFd08lMw=;
        b=hz3XrSB+KBpqUPLDKyw2Jxr41b1CEp+1/qVyRxUWVhXQ2yO3pcwZzRTc/RmcOuftAe
         JDBdUygHnnCUA5eOUl15iri/Q+pJwjNj8QpABl/LDSDeAgJpmMZHz+yGbcIXyfe2T2rZ
         FdvN77qt6r5RmRuiTi8yBUPRt0a5xjswyuHdWiBKGCTG+oN1++x4EHZ0rAVV+SFC9hs6
         UDxdd63AtrdBw+WdHn1Vt/5QnsArLFY/nkfXoHP1FgeOnU37SLfzYzzzlHSa1ZHOSYSi
         ztfjgTFwRkHM3MohnmPFb+9aAdSDakwj2NKY9LhRrbQ4q9QibxP+9iEtqyGG4Bho2xcJ
         y52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dSeQpsX1lWyhJjjqgCnSOVYN/QoRMRw+pYlbFd08lMw=;
        b=kHFfioexx+HHg+D9u3FhSQFTXdJuyYR0eDgFv5IXIZ0MHTrzSFrtq1eLCIx7ho7qqz
         OBiEy+9SmfCzqSKzsoVrL6YPJ0sYKp/BS/0vT9uKv0/XSX2qGckOpMc91Gt9TytZePQu
         ViztFGGVkxxdFD3X59Va/G7H/K4P5bwXDTHmrNmHwx26h4n/YOCrZITCgzo4yJv9tXs5
         S/zTp6M7t4DjiFV2IZ6vazvoFw4uFaQcQfDJdJ454IYUrLbDnwziQHEq38C9QOKcvSRS
         QEarnEvZvUoUGR2h9yx/lK2PiS1eTx7g/b9V9iiuNMMnAavm0v/zcjDP7VkYZnr7sM6o
         mmdQ==
X-Gm-Message-State: APjAAAUq4jtQjr9Www4Ln1fF4hCT11HRbCG5CAxtmCNDChmUrRdZQElC
        wjBzPKYhk38qjPDYYtZLEhMruNCpHGQ=
X-Google-Smtp-Source: APXvYqyMG++9BlE+2Kvq0zYfc9v90AGN3ajctmqk/j3JHgJFv9ZF19h9kZYjj54VOjc0kFu8V8CcXg==
X-Received: by 2002:adf:ed84:: with SMTP id c4mr6235302wro.333.1571384317887;
        Fri, 18 Oct 2019 00:38:37 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id 36sm5585697wrp.30.2019.10.18.00.38.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 00:38:37 -0700 (PDT)
Date:   Fri, 18 Oct 2019 08:38:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        linux-kernel@vger.kernel.org, tglx@linutronix.de,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 29/34] backlight/jornada720: Use CONFIG_PREEMPTION
Message-ID: <20191018073835.GU4365@dell>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-30-bigeasy@linutronix.de>
 <20191017113707.lsjwlhi6b4ittcpe@holly.lan>
 <20191017132324.GP4365@dell>
 <20191017132846.ojsh27celyl76dlx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191017132846.ojsh27celyl76dlx@linutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On Thu, 17 Oct 2019, Sebastian Andrzej Siewior wrote:

> On 2019-10-17 14:23:24 [+0100], Lee Jones wrote:
> > So what are the OP's expectations in that regard?  I see this is a
> > large set and I am only privy to this patch, thus lack wider
> > visibility.  Does this patch depend on others, or is it independent?
> > I'm happy to take it, but wish to avoid bisectability issues in the
> > next release kernel.
> 
> It is independent, you can apply it to your -next branch. All
> dependencies are merged.
> 
> Sebastian

Wonderful.  Thanks for the info.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
