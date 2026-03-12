Return-Path: <linux-fbdev+bounces-6586-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GjmNzvWsmlDQAAAu9opvQ
	(envelope-from <linux-fbdev+bounces-6586-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Mar 2026 16:05:31 +0100
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD8273E54
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Mar 2026 16:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B792C3006145
	for <lists+linux-fbdev@lfdr.de>; Thu, 12 Mar 2026 15:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7F939936F;
	Thu, 12 Mar 2026 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Y8sfqnAR"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E338B142;
	Thu, 12 Mar 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773327881; cv=none; b=iQAxPCBC248HClQffYYv4jIrcQ+DhHGR09leBbb3fa8L/Xl0Wie1K8hmMZiW2i+2lZL0hMGKKMvn6NrarBPTfEn1RrR9YFw3tqMPMbLr7wGbM0gemKWCS/yeAXh/VNM8Oq95pj0M3Ief+0Mlzwh8CX2DR8VjamQjPsmjMyaSB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773327881; c=relaxed/simple;
	bh=5yn5GwN8e77Zvr2UbetD0sQP7ujb3Etv7aD7254328A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QfxNsNOePaxmkvkqgrphR/E/xIy4HF5J9sXNHqtOB5oSPz/0qvCEXeCzPTBk08wUSgoOK+mx3+vG7QhMsIhHCd/xn4znAkbnz3R7p7B5BIVyk2jq7p8HMhFndxy9EJH+u5VS0kBy1io2DaguU3lDFvt7Z+sAP5Q/qU19COSx1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Y8sfqnAR; arc=none smtp.client-ip=79.135.106.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773327863; x=1773587063;
	bh=s5vD/3jiwZDsqjfUekNmkJYrqPiPHrOuRoXry51QCDo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Y8sfqnARTmNhdQlzF3AW9buodjfSIcaPBdJLMoDanmwqi3oDmktiluk1MRhjp+7xm
	 GyP7jmZnC6NpNtUn+mlWUk8OGRn6tiAw9Z6rqQgtxEDNY/v87yrl264WPXgh72ZD4u
	 30mdMY6oqSYxYKj2bB1ac02kLfgoTvxRVMEhxZMv+JD55DDH/CFwdqs8bdI/FhW6yc
	 e0hYWY2cYhflud3LMbYMTSv8H5jDxse39cBRQpKNio4bNS+fkgqGJlz7oZ5/A94NTj
	 Doa/6yPj8p/WxVwJO1k0qKKsARZZBS8hfmNy5eeYUwS1/yKA0k1BmPGkk61suNL8Qf
	 IrWchuesrfTSw==
Date: Thu, 12 Mar 2026 15:04:14 +0000
To: Thomas Zimmermann <tzimmermann@suse.de>, Hardik Phalet <hardik.phalet@pm.me>, Ferenc Bakonyi <fero@drama.obuda.kando.hu>, Helge Deller <deller@gmx.de>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Brigham Campbell <me@brighamcampbell.com>, linux-nvidia@lists.surfsouth.com, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] fbdev/hga: Request memory region before ioremap
Message-ID: <DH0W99FBZJEX.30MPSPJVGV4ZF@pm.me>
In-Reply-To: <3d58e520-0308-44c7-a43a-e438548e9c40@suse.de>
References: <20260310123004.888132-1-hardik.phalet@pm.me> <3d58e520-0308-44c7-a43a-e438548e9c40@suse.de>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 54fb3e1b6690e70aa76165ed646ac52d8fea7c6c
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6586-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[suse.de,pm.me,drama.obuda.kando.hu,gmx.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,linux-fbdev@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:url,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: A5DD8273E54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 10, 2026 at 6:38 PM IST, Thomas Zimmermann wrote:
> Hi,
>
> thanks for the patch. Let's hope there are no conflicts with other
> hardware.=C2=A0 IDK if anyone still uses this driver.
Hi Thomas,

Thanks for reviewing this.

Since I currently do not have access to the hardware needed to test the
change properly, I will drop this patch for now. I may revisit it once I
can validate the behavior on real hardware.=20

Thanks again for your feedback.

Best regards,
Hardik
>
> Am 10.03.26 um 13:30 schrieb Hardik Phalet:
>> The driver calls ioremap() on the HGA video memory at 0xb0000 without
>> first reserving the physical address range. This leaves the kernel
>> resource tree incomplete and can cause silent conflicts with other
>> drivers claiming the same range.
>>
>> Add a devm_request_mem_region() call before ioremap() in
>> hga_card_detect() to reserve the memory region.
>>
>> Signed-off-by: Hardik Phalet <hardik.phalet@pm.me>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
> Best regards
> Thomas
>
>> ---
>> Changes in v3:
>> - Used dev_err() to log memory region request, based on another review
>>    comment by Thomas [2].
>> Changes in v2:
>> - Used devm_request_mem_region instead of request_mem_region, based on a
>> =09review comment by Thomas [1].
>>
>> v1: https://lore.kernel.org/all/20260310064124.602848-1-hardik.phalet@pm=
.me/
>> v2: https://lore.kernel.org/all/20260310113810.789575-1-hardik.phalet@pm=
.me/
>> [1]: https://lore.kernel.org/all/5f9749ba-18a8-4b6b-a6e7-a011a3871bfb@su=
se.de/
>> [2]: https://lore.kernel.org/all/ec635591-c861-4aa8-a259-718690ddaa4e@su=
se.de/
>>
>>   drivers/video/fbdev/hgafb.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
>> index 14418aa3791a..d32fd1c5217c 100644
>> --- a/drivers/video/fbdev/hgafb.c
>> +++ b/drivers/video/fbdev/hgafb.c
>> @@ -276,7 +276,7 @@ static void hga_blank(int blank_mode)
>>   =09spin_unlock_irqrestore(&hga_reg_lock, flags);
>>   }
>>
>> -static int hga_card_detect(void)
>> +static int hga_card_detect(struct platform_device *pdev)
>>   {
>>   =09int count =3D 0;
>>   =09void __iomem *p, *q;
>> @@ -284,6 +284,11 @@ static int hga_card_detect(void)
>>
>>   =09hga_vram_len  =3D 0x08000;
>>
>> +=09if (!devm_request_mem_region(&pdev->dev, 0xb0000, hga_vram_len, "hga=
fb")) {
>> +=09=09dev_err(&pdev->dev, "cannot reserve video memory at 0xb0000\n");
>> +=09=09return -EBUSY;
>> +=09}
>> +
>>   =09hga_vram =3D ioremap(0xb0000, hga_vram_len);
>>   =09if (!hga_vram)
>>   =09=09return -ENOMEM;
>> @@ -568,7 +573,7 @@ static int hgafb_probe(struct platform_device *pdev)
>>   =09struct fb_info *info;
>>   =09int ret;
>>
>> -=09ret =3D hga_card_detect();
>> +=09ret =3D hga_card_detect(pdev);
>>   =09if (ret)
>>   =09=09return ret;
>>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 N=C3=BCrnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG N=
=C3=BCrnberg)



